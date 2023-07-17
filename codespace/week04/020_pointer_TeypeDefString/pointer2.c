#include <stdio.h>

typedef char* string;

int main(void)
{
    string s = "Hi!";
    printf("%p\n", s);      //without string.h
    printf("%s\n", s);      //printf has that function to handle string and pointer as well
    printf("%c\n", *s);     //oh, boy... -.-
}