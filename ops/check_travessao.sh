#!/usr/bin/env bash
#
# check_travessao.sh - barra travessão, e diz QUAL alternativa usar em cada caso.
#
# ── Por que existe ──
# A regra "proibido travessão" já estava escrita no CLAUDE.md, e mesmo assim o caractere
# continuava entrando. O que faltava não era a lista de alternativas: era dizer QUANDO usar
# cada uma, no lugar onde a pessoa lê no momento em que erra. Documento se lê uma vez; hook
# se lê toda vez.
#
# 🔑 E parênteses não serve para tudo. Ele é a melhor saída para o caso mais comum (o aparte),
# e ENFRAQUECE justamente o que a frase quer destacar quando o travessão era ênfase: em
# "o teto recusa 3 MB (e deixa passar 65 MB)" o parêntese esconde o ponto da frase.
#
# Uso:
#   ops/check_travessao.sh            # o que está staged (o que o hook faz)
#   ops/check_travessao.sh --tudo     # todos os arquivos rastreados
#   ops/check_travessao.sh --teste    # autoteste
#
# ⚠️ Escapes unicode de propósito: com o caractere literal, o script se acusaria sozinho.
set -uo pipefail

cd "$(cd "$(dirname "$0")/.." && pwd)" || exit 1

EN=$'–'   # en dash
EM=$'—'   # em dash
PADRAO="[${EN}${EM}]"

# O próprio script é a única exceção: ele precisa dos caracteres para procurar por eles.
EXCLUI='^ops/check_travessao\.sh$|\.(min\.(js|css)|map|lock)$'

if [ "${1:-}" = "--teste" ]; then
    TMP=$(mktemp); trap 'rm -f "$TMP"' EXIT
    printf 'uma frase %s com travessao\n' "$EM" > "$TMP"
    grep -qE "$PADRAO" "$TMP" && echo "✅ autoteste: detecta travessão" || { echo "🔴 autoteste FALHOU"; exit 1; }
    printf 'uma frase (com aparte) e um intervalo 10-15 min\n' > "$TMP"
    grep -qE "$PADRAO" "$TMP" && { echo "🔴 autoteste: falso positivo em hífen"; exit 1; } || echo "✅ autoteste: hífen não é acusado"
    exit 0
fi

if [ "${1:-staged}" = "--tudo" ]; then
    LISTA=$(git ls-files)
else
    LISTA=$(git diff --cached --name-only --diff-filter=ACM)
fi
[ -z "$LISTA" ] && exit 0

ACHOU=0
while IFS= read -r f; do
    [ -n "$f" ] && [ -f "$f" ] || continue
    printf '%s' "$f" | grep -qE "$EXCLUI" && continue
    hits=$(grep -nIE "$PADRAO" "$f" 2>/dev/null | head -3)
    if [ -n "$hits" ]; then
        [ "$ACHOU" -eq 0 ] && echo ""
        echo "  🔴 travessão em $f"
        printf '%s\n' "$hits" | cut -c1-130 | sed 's/^/       /'
        ACHOU=$((ACHOU + 1))
    fi
done <<< "$LISTA"

[ "$ACHOU" -eq 0 ] && exit 0

cat <<FIM

─────────────────────────────────────────────────────────────────
🔴 COMMIT BARRADO - travessão.

Ele é a assinatura visual mais óbvia de texto gerado por IA, e o que
entregamos precisa passar credibilidade de trabalho humano.

QUAL ALTERNATIVA USAR (não é sempre parênteses):

  aparte, comentário que sai da frase   ->  PARÊNTESES
      "a mensagem $EM foi legal"  vira  "a mensagem (foi legal)"

  ênfase ou conclusão                   ->  hífen, dois-pontos ou ponto final
      "recusa 3 MB $EM e deixa passar 65 MB"
      O parêntese aqui ESCONDE o que a frase quer destacar.

  separador em lista ou tabela          ->  dois-pontos ou hífen
      "status $EM ativo"  vira  "status: ativo"

  aposto no meio da frase               ->  vírgulas ou parênteses
      "a regra $EM que ninguém leu $EM falhou"
      vira "a regra, que ninguém leu, falhou"

  intervalo ou palavra composta         ->  hífen simples
      "10-15 min", "pré-fix"

⚠️ Trecho longo entre parênteses cansa mais que o travessão: quebre em
duas frases. E dois apartes na mesma frase é sinal de que ela precisa
virar duas.
─────────────────────────────────────────────────────────────────
FIM
exit 1
