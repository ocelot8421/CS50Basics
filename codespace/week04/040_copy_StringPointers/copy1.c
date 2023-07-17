#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    // Get a string
    // char* s = get_string("s: "); //same as:
    string s = get_string("s: ");

    // Copy string's address  <<<!!! keep in mind !!!
    // char* t = s; // same as:
    string t = s;
    printf("t: %s\n", t);

    // Capitalize first letter in string
    if (strlen(t) > 0)
    {
        t[0] = toupper(t[0]);
    }

    // Print string twice
    printf("as string:  as pointer:\n");
    printf("s: %-8s s: %p\n", s, s);
    printf("t: %-8s t: %p\n", t, t);
}