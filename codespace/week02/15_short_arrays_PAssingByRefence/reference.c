#include <cs50.h>
#include <stdio.h>

void set_array(int array[4]);
// void set_int(int x);
int set_int(int x);

int main(void)
{
    int a = 10;
    // int b[] = {0, 1, 2, 3};
    int b[4] = {0, 1, 2, 3};
    int c = set_int(a);
    set_array(b);
    printf("%d %d %d\n", a, b[0], c);
}

void set_array(int array[4])
{
    array[0] = 22;
}


// void set_int(int x)
int set_int(int x)
{
    x = 22;
    return x;
}
