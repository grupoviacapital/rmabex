#!/usr/bin/env bash
# Medidor de contexto ao vivo para o Claude Code (projeto rmabex).
# Le o JSON da sessao no stdin e imprime uma linha de status com:
#   diretorio | modelo | [barra de contexto] uso% (tokens/max) + aviso.
# Config: .claude/settings.json -> "statusLine".

input=$(cat)

# --- coleta campos (com defaults seguros se ainda nao existirem no inicio) ---
model=$(printf '%s' "$input" | jq -r '.model.display_name // "Claude"')
dir=$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd // ""')
dir_base=$(basename "$dir" 2>/dev/null)

pct=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
tokens=$(printf '%s' "$input" | jq -r '.context_window.total_input_tokens // 0')
max=$(printf '%s' "$input" | jq -r '.context_window.context_window_size // 0')

# saneia numeros
[ -z "$pct" ] && pct=0
case "$pct" in ''|*[!0-9]*) pct=0;; esac
[ "$pct" -gt 100 ] && pct=100

# --- barra visual de 10 blocos ---
filled=$((pct / 10))
[ "$filled" -lt 0 ] && filled=0
[ "$filled" -gt 10 ] && filled=10
empty=$((10 - filled))
bar=""
i=0; while [ "$i" -lt "$filled" ]; do bar="${bar}█"; i=$((i+1)); done
i=0; while [ "$i" -lt "$empty" ];  do bar="${bar}░"; i=$((i+1)); done

# --- cores por faixa (verde < 50, amarelo 50-79, vermelho >= 80) ---
reset=$'\033[0m'; dim=$'\033[2m'
if   [ "$pct" -ge 80 ]; then color=$'\033[31m'; warn=" ⚠ contexto cheio, considere /compact"
elif [ "$pct" -ge 50 ]; then color=$'\033[33m'; warn=""
else                        color=$'\033[32m'; warn=""
fi

# --- tokens legiveis (milhares) ---
fmt_k() { awk -v n="$1" 'BEGIN{ if(n>=1000) printf "%.0fk", n/1000; else printf "%d", n }'; }
tok_h=$(fmt_k "$tokens"); max_h=$(fmt_k "$max")

printf '%s%s%s  %s%s%s  %s%s %d%%%s %s(%s/%s)%s%s' \
  "$dim" "$dir_base" "$reset" \
  "$dim" "$model" "$reset" \
  "$color" "$bar" "$pct" "$reset" \
  "$dim" "$tok_h" "$max_h" "$reset" \
  "$warn"
