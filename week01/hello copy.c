#include <cs50.h>
#include <stdio.h>

int main(void)
{
    printf("hello, girl\n");
    string answer = get_string("What's your name?\n ");
    printf("hello, %s\n", answer);
}