;��������� ������������ � ������ SetCler ����
;   Procedure (var A: LONGWORD; N:LONGWORD; P:LONGWORD)
;����������� ��������� ������� N ������� ������ S
;� ����, ���� P=0, � �������,���� P �� ����� 0.

.386
.model FLAT,PASCAL
PUBLIC SetCler


.CODE
SetCler PROC
A EQU DWORD PTR[EBP+20]         ;���� ������
N EQU DWORD PTR[EBP+16]         ;����� �������
L EQU DWORD PTR[EBP+12]
P EQU DWORD PTR[EBP+8]          ;��������

  PUSH EBP                      ;����� ������ ����� EBP
  MOV EBP,ESP                   ;����� � EBP ������� �������� ESP

  PUSH EBX                      ;��������� ��������
  PUSH ESI

  MOV ECX, L
  MOV ESI,N                     ;� ESI ������ ����� �������
  MOV EBX,A                     ;����� ������
  CMP ESI, 32
  JNA M
  MOV ECX, L
  MOV ESI, N
  SUB ECX, ESI
  MOV EDX, 0
  MOV EAX, ECX
  MOV ESI, 32
  DIV ESI

  MOV EDX, 0
  MOV ESI, 4
  MUL ESI
  MOV ESI, EAX

  MOV EBX, A[ESI]

M:
  MOV EAX, 32                   ;��������� ����� �� ������� �����
  SUB EAX, ESI                  ;� �������� �����
  MOV ESI, EAX
M0:
  CMP P,0                       ;���������� ����� � �����
  JE M1                         ;���� �����, �� ���� �� �1
  BTS [EBX], ESI
  JMP M2
M1:
  BTR [EBX], ESI
M2:
  POP ESI                       ;��������������� ��������
  POP EBX
  POP EBP
  RET 12
SetCler ENDP
END
