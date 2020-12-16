.data

# Dados



# A entrada sera representada como x, que, começando de 1, vai ser incrementada de um por um ate 100
# A saida esperada sera representada como 'a', que, começando de 2, vai ser incrementada de dois em dois ate 200

x: .float 1.0
a: .float 2.0
w1: .float 0.3
w2: .float -0.1
aprendizado: .float 0.0001
novovalor: .float 500.0
mensagem1: .asciiz "Resultado obtido: "
mensagem2: .asciiz "Taxa de erro: "
breakline: .asciiz "\n"
.text
.globl main
main:

# Carregando os valores iniciais

la $t7, x
lwc1 $f8, 0($t7)
lwc1 $f2, 4($t7)
lwc1 $f6, 8($t7)
lwc1 $f4, 12($t7)
lwc1 $f24, 16($t7)


# Declarando variavel 'index'
addi $t0, $zero, 1

# Declarando limite de iteracoes para trinta
addi $t1, $zero, 30

TREINAMENTO:

# Comparando $t0 (index) a $t1 (maximo de iteracoes)
slt $t2, $t0, $t1

# Se $t2 = 0 (i >= 30), JUMP TESTENOVOVALOR
beq $t2, $zero TESTENOVOVALOR

# armazenando x * w1 no registrador $f10
mul.s $f10, $f6, $f8

# armazenando x * w2 no registrador $f12
mul.s $f12, $f4, $f8

# armazenando $f10 + $f12 (result) no registrador $f14
add.s $f14, $f10, $f12

# armazenando $f1 - $f12 (erro) no registrador $f16
sub.s $f16, $f2, $f14

# armazenando erro * taxa de aprendizado no registrador $f18
mul.s $f18, $f16,  $f24

# armazenando $f18 (erro * taxa de aprendizado) * a (entrada) em $f20
mul.s $f20, $f18, $f2

# armazenando $f20 + $f6 em $f6 (w1 = w1 + (erro * taxaAprendizado * a))
add.s $f6, $f6, $f20

# armazenando $f20 + $f4 em $f4 (w2 = w2 + (erro * taxaAprendizado * a))
add.s $f4, $f4, $f20

# incrementando valor de x
lwc1 $f20, 0($t7)
add.s $f8, $f8, $f20

# incrementando valor de a
lwc1 $f22, 4($t7)
add.s $f2, $f2, $f22

# incrementando index
addi $t0, $t0, 1

j TREINAMENTO

TESTENOVOVALOR:

# Adicionando um novo valor a ser testado no registrador $f18
lwc1 $f18, 20($t7)

# armazenando x * w1 no registrador $f12
mul.s $f12, $f6, $f18

# armazenando x * w2 no registrador $f10
mul.s $f10, $f4, $f18

# armazenando $f10 + $f12 (result) no registrador $f16
add.s $f16, $f10, $f12

# armazenando $f28 * 2 (dobro do valor testado) - $f16  (erro) no registrador $f14
lwc1 $f28, 4($t7)
mul.s $f28, $f28, $f18
sub.s $f14, $f28, $f16

# Printar mensagem1
li $v0, 4 
la $a0, mensagem1
syscall

# Printar resultado 
mov.d $f12, $f16
li $v0, 2
syscall

# Printar quebra de linha
li $v0, 4
la $a0, breakline
syscall

# Printar mensagem2
li $v0, 4
la $a0, mensagem2
syscall

# Printar taxa de erro
mov.d $f12, $f14
li $v0, 2
syscall


END:
jr $ra