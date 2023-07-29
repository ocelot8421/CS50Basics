#include <stdio.h>

int main(void)
{
    int a = 1;
    int* p = &a;

    for(int i = 0; i < 999999; i++)
    {
        printf("%i", *(p + i));
    }
}