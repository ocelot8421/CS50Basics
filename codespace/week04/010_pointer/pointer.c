#include <stdio.h>

int main(void)
{
    int n = 50;
    // int *p = &n;
    int* p = &n;          //integer érték változójának címe, hexadeximális
    printf("[int*]    p = %-16p  &n = %-16p\n", p, &n);
    printf("[int]    *p = %-16i   n = %-16i\n", *p, n); //*p "go there"

    // char *s = "HI!";
    char* s = "HI!";
    printf("%s %p %p\n", s, s, &s);
    printf("%c %p\n", s[0], &s[0]);
    printf("%c %p\n", s[1], &s[1]);
    printf("%c %p\n", s[2], &s[2]);
    printf("%c %p\n", s[3], &s[3]);
    printf(" - - - \n");

    printf("%c %s\n", *s, s);
    printf("%c %s\n", *(s + 0), s + 0);  //same as bracket version
    printf("%c %s\n", *(s + 1), s + 1);
    printf("%c %s\n", *(s + 2), s + 2);
}