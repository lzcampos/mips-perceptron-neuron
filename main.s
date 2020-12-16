.data

# Dados

mensagem1: .asciiz "Resultado obtido: "
mensagem2: .asciiz "Taxa de erro: "

# A entrada sera representada como x, que, começando de 1, vai ser incrementada de um por um ate 100
# A saida esperada sera representada como 'a', que, começando de 2, vai ser incrementada de dois em dois ate 200

x: .float 1.0
a: .float 2.0
w1: .float 0.3
w2: .float -0.1
aprendizado: .float 0.001
novovalor: .float 500.0

.text

# Carregando os valores iniciais

la $t7, x
lwc1 $f0, 0($t7)
lwc1 $f1, 4($t7)
lwc1 $f2, 8($t7)
lwc1 $f3, 12($t7)
lwc1 $f4, 16($t7)


# Declarando variavel 'index'
addi $t0, $zero, 1

# Declarando limite de iteracoes para cem
addi $t1, $zero, 100

TREINAMENTO:

# Comparando $t0 (index) a $t1 (maximo de iteracoes)
slt $t2, $t0, $t1

# Se $t2 = 0 (i >= 10), JUMP TESTENOVOVALOR
beq $t2, $zero TESTENOVOVALOR

# armazenando x * w1 no registrador $f10
mul.s $f10, $f2, $f0

# armazenando x * w2 no registrador $f11
mul.s $f11, $f3, $f0

# armazenando $f10 + $f11 (result) no registrador $f12
add.s $f12, $f10, $f11

# armazenando $f1 - $f12 (erro) no registrador $f13
sub.s $f13, $f1, $f12

# armazenando erro * taxa de aprendizado no registrador $f14
mul.s $f14, $f13,  $f4

# armazenando $f14 (erro * taxa de aprendizado) * a (entrada) em $f15
mul.s $f15, $f14, $f1

# armazenando $f15 + $f2 em $f2 (w1 = w1 + (erro * taxaAprendizado * a))
add.s $f2, $f2, $f15

# armazenando $f15 + $f3 em $f3 (w2 = w2 + (erro * taxaAprendizado * a))
add.s $f3, $f3, $f15

# incrementando valor de x
lwc1 $f20, 0($t7)
add.s $f0, $f0, $f20

# incrementando valor de a
lwc1 $f21, 4($t7)
add.s $f1, $f1, $f21

# incrementando index
addi $t0, $t0, 1

j TREINAMENTO

TESTENOVOVALOR:

# Adicionando um novo valor a ser testado no registrador $f16
lwc1 $f16, 20($t7)

# armazenando x * w1 no registrador $f10
mul.s $f10, $f2, $f16

# armazenando x * w2 no registrador $f11
mul.s $f11, $f3, $f16

# armazenando $f10 + $f11 (result) no registrador $f12
add.s $f12, $f10, $f11

# armazenando $f1 - $f12 (erro) no registrador $f13
sub.s $f13, $f1, $f12

# Printar mensagem1
li $v0, 4 
la $a0, mensagem1
syscall

# Printar resultado (já está no $f12, então basta dar syscall)
li $v0, 2
syscall

# Printar mensagem2
li $v0, 4
la $a0, mensagem2
syscall

# Printar taxa de erro
li $v0, 3
mov.d $f12, $f13
syscall

jr $ra