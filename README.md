# mips-perceptron-neuron

## Modelo do perceptron

- saida = x1*w1 + x2*w2
- x1 e x2 são as entradas (estáticas)
- w1 e w2 são os coeficientes (que devem ser mudados de acordo com a execução do programa)
- Taxa de aprendizado empregada = 0.001


## Estratégia de Treinamento

- Iniciar os pesos com valores aleatórios
- Para cada conjunto de dados, calcular o erro na saída no neurônio (erro = saída desejada - saída do neurônio)
- Atualizar o valor de cassa peso com a equação:
    * Wx = Wx + Erro * TaxaAprendizado * Entrada
