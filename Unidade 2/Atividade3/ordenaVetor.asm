.data

vetor: 	.word 7, 2, 9, 1, 5

.text
.globl main

main:
	la $t1, vetor			#la - load address - ler o endereço de memória do vetor e salva em t1


	lw $t2, 0($t1)			#lw - load word - Carrega em $t2 o que está armazenado no endereço de memória informado por $t1 + 0
	lw $t3, 4($t1)			#lw - load word - Carrega em $t3 o que está armazenado no endereço de memória informado por $t1 + 4
	slt $t4, $t3, $t2		#slt - Set on less Than - Verifica se $t3 é menor do que $t2 e carrega em $t4 o resultado da comparação. Se menor recebe 1, se não -> 0
	bne $t4, 0, success		#beq - Branch if Not Equal - Verifica se $t4 é diferente de 0 e "pula" para a a label success
	j failure

#Acontece troca
success:
	sw $t3, 0($t1)		#sw - store word - Coloca o valor armazenado em $t3 na primeira posição do vetor, através do endereço de memória apontado por $t1 + 0
	sw $t2, 4($t1)		#sw - store word - Coloca o valor armazenado em $t2 na segunda posição do vetor, através do endereço de memória apontado por $t1 + 4

#Não acontece troca e avança para a próxima linha
failure:
	lw $t2, 4($t1)		#lw - load word - Carrega em $t2 o que está armazenado no endereço de memória informado por $t1 + 4
	lw $t3, 8($t1)		#lw - load word - Carrega em $t3 o que está armazenado no endereço de memória informado por $t1 + 8 (atualizado)
	slt $t4, $t3, $t2	#slt - Set on less Than - Verifica se $t3 é menor do que $t2 e carrega em $t4 o resultado da comparação. Se menor recebe 1, se não -> 0
	bne $t4, 0, success2	#beq - Branch if Not Equal - Verifica se $t4 é diferente de 0 e "pula" para a a label success
	j failure2

#Acontece troca
success2:
	sw $t3, 4($t1)		#sw - store word - Coloca o valor armazenado em $t6 na segunda posição do vetor, através do endereço de memória apontado por $t1 + 4
	sw $t2, 8($t1)		#sw - store word - Coloca o valor armazenado em $t2 na terceira posição do vetor, através do endereço de memória apontado por $t1 + 8
	lw $t2, 0($t1)		#lw - load word - Carrega em t2 o que está armazenado no endereço de memória informado por $t1 + 0 (atualizado)
	lw $t3, 4($t1)		#lw - load word - Carrega em t3 o que está armazenado no endereço de memória informado por $t1 + 4 (atualizado)
	slt $t4, $t3, $t2	#slt - Set on less Than - Verifica se $t3 é menor do que $t2 e carrega em $t4 o resultado da comparação. Se menor recebe 1, se não -> 0
	bne $t4, 0, success3	#beq - Branch if Not Equal - Verifica se $t4 é diferente de 0 e "pula" para a a label success
	j failure2

#Acontece troca
success3:
	sw $t3, 0($t1)		#sw - store word - Coloca o valor armazenado em $t3 na primeira posição do vetor, através do endereço de memória apontado por $t1 + 0 (atualizado)
	sw $t2, 4($t1)		#sw - store word - Coloca o valor armazenado em $t2 na segunda posição do vetor, através do endereço de memória apontado por $t1 + 4 (atualizado)

#Não acontece troca e avança para a próxima linha
failure2:
	lw $t2, 8($t1)		#lw - load word - Carrega em t5 o que está armazenado no endereço de memória informado por $t1 + 8
	lw $t3, 12($t1)		#lw - load word - Carrega em t6 o que está armazenado no endereço de memória informado por $t1 + 12 (o que está anterior atualizado)
	slt $t4, $t3, $t2	#slt - Set on less Than - Verifica se $t3 é menor do que $t2 e carrega em $t4 o resultado da comparação. Se menor recebe 1, se não -> 0
	bne $t4, 0, success4	#beq - Branch if Not Equal - Verifica se $t4 é diferente de 0 e "pula" para a a label success
	j failure3

#Acontece troca
success4:
	sw $t3, 8($t1)		#sw - store word - Coloca o valor armazenado em $t6 na segunda posição do vetor, através do endereço de memória apontado por $t1 + 8
	sw $t2, 12($t1)		#sw - store word - Coloca o valor armazenado em $t2 na terceira posição do vetor, através do endereço de memória apontado por $t1 + 12
	lw $t2, 4($t1)		#lw - load word - Carrega em t2 o que está armazenado no endereço de memória informado por $t1 + 4 (atualizado)
	lw $t3, 8($t1)		#lw - load word - Carrega em t3 o que está armazenado no endereço de memória informado por $t1 + 8 (atualizado)
	slt $t4, $t3, $t2	#slt - Set on less Than - Verifica se $t3 é menor do que $t2 e carrega em $t4 o resultado da comparação. Se menor recebe 1, se não -> 0
	bne $t4, 0, success5	#beq - Branch if Not Equal - Verifica se $t4 é diferente de 0 e "pula" para a a label success
	j failure3

#Acontece troca
success5:
	sw $t3, 4($t1)		#sw - store word - Coloca o valor armazenado em $t6 na segunda posição do vetor, através do endereço de memória apontado por $t1 + 4
	sw $t2, 8($t1)		#sw - store word - Coloca o valor armazenado em $t2 na terceira posição do vetor, através do endereço de memória apontado por $t1 + 8
	lw $t2, 0($t1)		#lw - load word - Carrega em t2 o que está armazenado no endereço de memória informado por t1 + 0 (atualizado)
	lw $t3, 4($t1)		#lw - load word - Carrega em t3 o que está armazenado no endereço de memória informado por t1 + 4 (atualizado)
	slt $t4, $t3, $t2		#slt - Set on less Than - Verifica se $t3 é menor do que $t2 e carrega em $t4 o resultado da comparação. Se menor recebe 1, se não -> 0
	bne $t4, 0, success6	#beq - Branch if Not Equal - Verifica se $t4 é diferente de 0 e "pula" para a a label success
	j failure3

#Acontece troca
success6:
	sw $t3, 0($t1)		#sw - store word - Coloca o valor armazenado em $t6 na segunda posição do vetor, através do endereço de memória apontado por $t1 + 0
	sw $t2, 4($t1)		#sw - store word - Coloca o valor armazenado em $t2 na terceira posição do vetor, através do endereço de memória apontado por $t1 + 4

#Não acontece troca e avança para a próxima linha
failure3:
	lw $t2, 12($t1)		#lw - load word - Carrega em t2 o que está armazenado no endereço de memória informado por $t1 + 12 (atualizado)
	lw $t3, 16($t1)		#lw - load word - Carrega em t3 o que está armazenado no endereço de memória informado por $t1 + 16 (atualizado)
	slt $t4, $t3, $t2		#slt - Set on less Than - Verifica se $t3 é menor do que $t2 e carrega em $t4 o resultado da comparação. Se menor recebe 1, se não -> 0
	bne $t4, 0, success7	#beq - Branch if Not Equal - Verifica se $t4 é diferente de 0 e "pula" para a a label success
	j failure4

#Acontece troca
success7:
	sw $t3, 12($t1)		#sw - store word - Coloca o valor armazenado em $t6 na segunda posição do vetor, através do endereço de memória apontado por $t1 + 12
	sw $t2, 16($t1)		#sw - store word - Coloca o valor armazenado em $t2 na terceira posição do vetor, através do endereço de memória apontado por $t1 + 16
	lw $t2, 8($t1)		#lw - load word - Carrega em t2 o que está armazenado no endereço de memória informado por $t1 + 8 (atualizado)
	lw $t3, 12($t1)		#lw - load word - Carrega em t3 o que está armazenado no endereço de memória informado por $t1 + 12 (atualizado)
	slt $t4, $t3, $t2		#slt - Set on less Than - Verifica se $t3 é menor do que $t2 e carrega em $t4 o resultado da comparação. Se menor recebe 1, se não -> 0
	bne $t4, 0, success8	#beq - Branch if Not Equal - Verifica se $t4 é diferente de 0 e "pula" para a a label success
	j failure4

#Acontece troca
success8:
	sw $t3, 8($t1)		#sw - store word - Coloca o valor armazenado em $t6 na segunda posição do vetor, através do endereço de memória apontado por $t1 + 8
	sw $t2, 12($t1)		#sw - store word - Coloca o valor armazenado em $t2 na terceira posição do vetor, através do endereço de memória apontado por $t1 + 12
	lw $t2, 4($t1)		#lw - load word - Carrega em t2 o que está armazenado no endereço de memória informado por $t1 + 4 (atualizado)
	lw $t3, 8($t1)		#lw - load word - Carrega em t3 o que está armazenado no endereço de memória informado por $t1 + 8 (atualizado)
	slt $t4, $t3, $t2		#slt - Set on less Than - Verifica se $t3 é menor do que $t2 e carrega em $t4 o resultado da comparação. Se menor recebe 1, se não -> 0
	bne $t4, 0, success9	#beq - Branch if Not Equal - Verifica se $t4 é diferente de 0 e "pula" para a a label success
	j failure4

#Acontece troca
success9:
	sw $t3, 4($t1)		#sw - store word - Coloca o valor armazenado em $t6 na segunda posição do vetor, através do endereço de memória apontado por $t1 + 4
	sw $t2, 8($t1)		#sw - store word - Coloca o valor armazenado em $t2 na terceira posição do vetor, através do endereço de memória apontado por $t1 + 8
	lw $t2, 0($t1)		#lw - load word - Carrega em t2 o que está armazenado no endereço de memória informado por $t1 + 0 (atualizado)
	lw $t3, 4($t1)		#lw - load word - Carrega em t3 o que está armazenado no endereço de memória informado por $t1 + 4 (atualizado)
	slt $t4, $t3, $t2	#slt - Set on less Than - Verifica se $t3 é menor do que $t2 e carrega em $t4 o resultado da comparação. Se menor recebe 1, se não -> 0
	bne $t4, 0, success10	#beq - Branch if Not Equal - Verifica se $t4 é diferente de 0 e "pula" para a a label success
	j failure4

#Acontece troca
success10:
	sw $t3, 0($t1)		#sw - store word - Coloca o valor armazenado em $t6 na segunda posição do vetor, através do endereço de memória apontado por $t1 + 0
	sw $t2, 4($t1)		#sw - store word - Coloca o valor armazenado em $t2 na terceira posição do vetor, através do endereço de memória apontado por $t1 + 4


#Imprime o vetor ordenado
failure4:
	li $v0, 1

    	lw $a0, 0($t1)
    	syscall

    	li $v0, 11
    	li $a0, 44
    	syscall

    	li $v0, 1
    	lw $a0, 4($t1)
    	syscall

    	li $v0, 11
    	li $a0, 44
    	syscall

	li $v0, 1
    	lw $a0, 8($t1)
    	syscall

    	li $v0, 11
    	li $a0, 44
    	syscall

    	li $v0, 1
    	lw $a0, 12($t1)
    	syscall


    	li $v0, 11
    	li $a0, 44
    	syscall

    	li $v0, 1
    	lw $a0, 16($t1)
    	syscall

    	li $v0, 10
    	syscall
