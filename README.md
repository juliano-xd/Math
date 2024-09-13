# Operações de Números de 256 Bits em Assembly

Este repositório contém um arquivo Assembly que define funções para realizar operações aritméticas em números de 256 bits. As operações suportadas são soma, subtração e multiplicação. As funções trabalham com números representados por quatro valores de 64 bits.

## Arquivo Assembly

O arquivo Assembly (`math.asm`) inclui as seguintes funções:

### Funções

#### `_bigSum`

**Descrição:** Realiza a soma de dois números de 256 bits.

**Parâmetros:**
- `rdi` (endereço do primeiro número de 256 bits)
- `rsi` (endereço do segundo número de 256 bits)

**Uso:**
A função `_bigSum` soma dois números de 256 bits localizados nos endereços fornecidos em `rdi` e `rsi`. O resultado é armazenado no endereço apontado por `rdi`.

**Exemplo de chamada:**

```assembly
mov rdi, endereço_primeiro_numero
mov rsi, endereço_segundo_numero
call _bigSum
