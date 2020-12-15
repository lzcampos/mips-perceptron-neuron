.data

mensagem: .asciiz "Digite um numero\n"
numero: .word 1
sucessor: .word 1

.text

main:
li $v0, 4
la $a0, mensagem
syscall

li $v0, 5
syscall
sw $v0, numero

addi $t0, $v0, 1
sw $t0, sucessor

li $v0, 1
move $a0, $t0
syscall

jr $ra