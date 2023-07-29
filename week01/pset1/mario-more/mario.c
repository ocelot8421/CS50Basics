#include <cs50.h>
#include <stdio.h>

void print_startergap(int i, int n);
void print_starterhash(int i);

int main(void)
{
    //Prompt for the pyramid's height
    int n;
    do
    {
        n = get_int("Height: ");
    }
    while (n < 1 || n > 8);

    //For each row
    for (int i = 0; i < n; i++)
    {
        //Left pyramid
        print_startergap(i, n);
        print_starterhash(i);
        //Gap
        printf("  ");
        //Rigth pyramid
        print_starterhash(i);
        //Move to next row
        printf("\n");
    }
}

// Gaps of pyramid
void print_startergap(int i, int n)
{
    for (int j = 0; j < n - i - 1; j++)
    {
        //Print brick
        printf(" ");
    }
}

// Bricks of pyramid
void print_starterhash(int i)
{
    for (int j = 0; j < i + 1; j++)
    {
        //Print brick
        printf("#");
    }
}