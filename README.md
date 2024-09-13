# Operações de Números de 256 Bits em Assembly

Este repositório foi desenvolvido para otimizar cálculos com números inteiros positivos de 256 bits, utilizando Assembly para garantir alta eficiência em operações aritméticas. É projetado para ser usado com código em C.

Desenvolvido para: x86_64

## Operações suportadas

Atualmente, o repositório oferece suporte para as seguintes operações:
* **Soma**      `_bigSum`: `A+=B`
* **Subtração**      `_bigSub`: `A-=B`
* **Multiplicação**      `_bigMul`: `A*=B`

Essas funções manipulam dois números de 256 bits, representados como dois arrays de `unsigned long long int` com 4 elementos cada (`number[4]`). O overflow é tratado corretamente, e cada array é considerado como um único número de 256 bits.

**Exemplo de uso**
```c

extern void _bigSum(unsigned long long int *a, unsigned long long int *b);
extern void _bigSub(unsigned long long int *a, unsigned long long int *b);
extern void _bigMul(unsigned long long int *a, unsigned long long int *b);

int main() {
    unsigned long long int numberA[] = {0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67897};
    unsigned long long int numberB[] = {0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67890, 0xA1B2C3D4E5F67897};

    // Realiza a soma: numberA += numberB
    _bigSum(numberA, numberB);

    // Realiza a subtração: numberA -= numberB
    _bigSub(numberA, numberB);

    // Realiza a multiplicação: numberA *= numberB
    _bigMul(numberA, numberB);

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
as -O3 -o math.o math.asm  # compila o asm para um arquivo de objeto, que deverá ser linkado ao programa quando for usado! 
```

**Após compilado, para linkar o math.o**
```shell
gcc -o seu_programa_compilado seu_programa.c ~/Math/math.o  # irá linkar o math.o ja compilado a seu_programa.c e gerar o elf ´seu_programa_compilado´
```
**Para rodar**
```shell
./seu_programa_compilado
```


