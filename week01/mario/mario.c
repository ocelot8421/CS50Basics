#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int n;
    do
    {
        n = get_int("Size: ");
    }
    while(n < 1);

    //For each row
    for(int i = 0; i < n; i++)
    {
        //For each column
        for(int j = 0; j < n; j++)
        {
            //Print brick
            printf("# ");
        }
        //Move to next row
        printf("\n");
    }

    //-------------

    // // 3. Four question marks are printed by do-while loop
    // int n;
    // do
    // {
    //     n = get_int("Width: ");
    // }
    // while(n < 1);

    // for(int i = 0; i < n; i++)
    // {
    //     printf("?");
    // }
    // printf("\n");

    // --------------

    // // 2. Four question marks printed by for loop
    // for(int i = 0; i < 4; i++)
    // {
    //     printf("?");
    // }
    // printf("\n");

    //----------------

    // // 1. Four question marks printed hard coded
    // printf("????\n");
}