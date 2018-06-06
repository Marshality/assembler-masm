// lab_11.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <cstdlib>

void print_arr(unsigned __int8 arr[][5])
{
    for (int i = 0; i < 5; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            printf("%2hhu ", arr[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void trans1(unsigned __int8 *arr)
{
    __asm
    {
        MOV EAX, 4 ; Ранг - 1
        MOV EBX, arr
        MOV ECX, EAX

M1:
        MOV ESI, 1
        MOV EDI, 4

M2:
        MOV EDX, EDI
        ADD EDI, ESI

        XCHG AH, [EBX][ESI]
        XCHG AH, [EBX][EDI]
        XCHG [EBX][ESI], AH

        INC ESI
        MOV EDI, EDX
        ADD EDI, 4

        LOOP M2

        MOV CL, AL

        DEC AL
        ADD EBX, 6

        LOOP M1
    }
}

void trans2(unsigned __int8 *arr)
{
    unsigned __int8 t;

    for (unsigned __int8 i = 0; i < 5; i++)
        for (unsigned __int8 j = i; j < 5; j++)
        {
            t = arr[i * 5 + j];
            arr[i * 5 + j] = arr[j * 5 + i];
            arr[j * 5 + i] = t;
        }
}

int _tmain(int argc, _TCHAR* argv[])
{
    unsigned __int8 arr1[5][5] = { {1,2,3,4,5}, {1,2,3,4,5}, {1,2,3,4,5}, {1,2,3,4,5}, {1,2,3,4,5} };
    unsigned __int8 arr2[5][5] = { {1,2,3,4,5}, {6,7,8,9,10}, {11,12,13,14,15}, {16,17,18,19,20}, {21,22,23,24,25} };

    print_arr(arr1);

    trans1((unsigned __int8*) arr1);

    print_arr(arr1);

    trans2((unsigned __int8*) arr1);

    print_arr(arr1);

    system("pause");

    return 0;
}

