#include <cs50.h>
#include <stdio.h>

int main(void)
{
    //Prompt for user's name
    string name = get_string("What's your name? ");

    //Say hello to the user
    printf("hello, %s\n", name);
}