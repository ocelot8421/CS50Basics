#include <cs50.h>
#include <stdio.h>

int main(void)
{
    char c1 = 'H';
    char c2 = 'I';
    char c3 = '!';

    printf("%c %c %c\n", c1, c2, c3);
    printf("%i %i %i\n", c1, c2, c3);

    printf(" - 1 - \n");

    string s = "HI!";
    printf("%i %i %i %i\n", s[0], s[1], s[2], s[3]); //last is null character
    printf("%c %c %c %c\n", s[0], s[1], s[2], s[3]); //last is null character


    string t = "BYE!";

    printf("%s\n", s);
    printf("%s\n", t);

    printf(" - 2 - \n");

    string words[2];
    words[0] = "HI!";
    words[1] = "BYE!";

    printf("%c\n", words[0][0]);
    printf("%c\n", words[1][0]);

}