DataS      SEGMENT PARA PUBLIC 'DATA'
Matrix     DB    1, 2, 3, 4, 5
		   DB    1, 2, 3, 4, 5
		   DB    1, 2, 3, 4, 5
		   DB    1, 2, 3, 4, 5
		   DB    1, 2, 3, 4, 5
DataS      ENDS
;
Code      SEGMENT PARA PUBLIC 'CODE'
		  ASSUME CS:Code, DS:DataS

BEGIN     PROC FAR
		  MOV  AX, DataS
		  MOV  DS, AX

DEFINES:  MOV  AL, 4 ; Количество повторов операции
	      MOV  BX, OFFSET Matrix ; Считывание матрицы
	      MOV  CL, AL ; Счетчик циклов

START:    MOV  SI, 1 ; Индекс источника \\ строка
		  MOV  DI, 5 ; Индекс назначения \\ столбец

TASK:     XCHG DL, Matrix[BX][SI]
		  XCHG DL, Matrix[BX][DI]
		  XCHG Matrix[BX][SI], DL

		  INC  SI
		  ADD  DI, 5

		  LOOP TASK

		  MOV  CL, AL

		  DEC  AL
		  ADD  BX, 6

		  LOOP START

DEFAULT:  MOV CX, 25
          MOV SI, 0

PRINT:    MOV AL, Matrix[SI]
          ADD AL, '0'
          MOV AH, 2
          MOV DX, AL
          INT 21H
          INC SI
          LOOP PRINT

DONE:     MOV AH, 4Ch
		  MOV AL, 0
		  INT 21h

BEGIN     ENDP

Code      ENDS
		  END BEGIN
