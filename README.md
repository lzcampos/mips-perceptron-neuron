# mips-perceptron-neuron

## Sobre o projeto

* Esse projeto se trata de um perceptron, e, a partir da comparação do resultado soma da multiplicação dos pesos do neurônio pela saída esperada, esses pesos são atualizados.
* Esse perceptron, especificamente, aprende a como dobrar o valor de uma entrada.
* Há, na pasta implementacaoJS, um exemplo de um código praticamente idêntico ao código assembly presente no arquivo main.s, porém feito em JavaScript.

## Como utilizar

* Para executar o programa, abra o arquivo main.s (que se localiza na raiz do repositório) no programa QtSpim.

### Modelo do perceptron

- saida = x1*w1 + x2*w2
- x1 e x2 são as entradas (estáticas)
- w1 e w2 são os coeficientes (que devem ser mudados de acordo com a execução do programa)
- Taxa de aprendizado empregada = 0.001


### Estratégia de Treinamento

- Iniciar os pesos com valores aleatórios
- Para cada conjunto de dados, calcular o erro na saída no neurônio (erro = saída desejada - saída do neurônio)
- Atualizar o valor de cassa peso com a equação:
    * Wx = Wx + Erro * TaxaAprendizado * Entrada
