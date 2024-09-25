# Operações de Números de 256 Bits em Assembly

Este repositório foi desenvolvido para otimizar cálculos com números inteiros positivos de 256 bits, utilizando Assembly para garantir alta eficiência em operações aritméticas. É projetado para ser usado com código em C.

Desenvolvido para: x86_64

## Operações suportadas

Atualmente, o repositório oferece suporte para as seguintes operações:
* **Soma**      `bigSum`: `A += B`
* **Soma um**      `bigSumOne`: `A++`
* **Subtração**      `bigSub`: `A -= B`
* **Subtrai um**      `bigSubOne`:`A--`
* **Multiplicação**      `bigMul`: `A *= B`
* **Comparação de igualdade**      `bigEql`:`A == B`
* **Comparação de diferença**      `bigDif`:`A != B`
* **Comparação maior-que**      `bigGreater`:`A == B`
* **Comparação menor-que**      `bigLess`:`A == B`

## Metas para a proxima atualização
* **Divisão**      `bigDiv`:`A /= B`
* **Modulo**      será o valor de retorno de `bigDiv`
* **ShiftLeft**      `bigShl`:`A = A << x` sendo `x` um valor de 0 a 256
* **ShiftRight**      `bigShr`:`A = A >> x` sendo `x` um valor de 0 a 256
* **Elevado ao quadrado**      `bigSqr`:`A = A²`
* **Elevado ao cubo**      `bigCbe`:`A = A³`

Essas funções manipulam dois números de 256 bits, representados como dois arrays de `unsigned long long int` com 4 elementos cada (`number[4]`). O overflow é tratado corretamente, e cada array é considerado como um único número de 256 bits.

**Exemplo de uso**
```c
#include <math.h>

int main() {
    _uint256t numberA = {0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67897};
    _uint256t numberB = {0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67897};

    // Realiza a soma: numberA += numberB
    bigSum(numberA, numberB);

    // Realiza a soma: numberA++
    bigSumOne(numberA);

    // Realiza a subtração: numberA -= numberB
    bigSub(numberA, numberB);

    // Realiza a subtração: numberA--
    bigSubOne(numberA);    

    // Realiza a multiplicação: numberA *= numberB
    bigMul(numberA, numberB);

    _Bool test;

    // Realiza a comparação: numberA == numberB
    test = bigEql(numberA, numberB);

    // Realiza a comparação: numberA != numberB
    test = bigDif(numberA, numberB);

    // Realiza a comparação: numberA > numberB
    test = bigGreater(numberA, numberB);

    // Realiza a comparação: numberA < numberB
    test = bigLess(numberA, numberB);

    return 0;
}

```


## Diferenciais

**Desempenho**

As funções são implementadas em Assembly para maximizar a eficiência, operando diretamente com instruções de máquina e minimizando o uso de recursos. Ao contrário de implementações como `BigInteger`, que dividem números em bytes e processam cada byte individualmente, este repositório realiza cálculos com números no formato nativo da CPU x86_64. As operações são feitas com tamanhos fixos e sem verificações desnecessárias, focando exclusivamente no tratamento de overflow e na propagação de carry.

## Download e Compilação

```shell
git clone https://github.com/juliano-xd/Math.git
cd Math
sudo make install # realiza todo o processo de instalação
```
Apos instalado, para poder linkar o math ao seu projeto, basta incluir `-lmath` a linha de compilação do gcc, por exemplo:

```shell
gcc -o main main.c -lmath
```

**Para rodar**
```shell
./main
```


