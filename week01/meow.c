#include <stdio.h>

void meow(int n); //prototype

int main(void)
{
    meow(3);

    // //For loop
    // for(int i = 0; i < 3; i++)
    // {
    //     meow();
    // }

    //While loop
    int i = 0;
    while(i < 3)
    {
        printf("meoooow\n");
        i++;
    }

    //For loop
    // for(int i = 0; i < 3; i++)
    // {
    //     printf("meow\n");
    // }
}


void meow(int n)
{
    for(int i = 0; i < n; i++)
    {
        printf("meow\n");
    }
}