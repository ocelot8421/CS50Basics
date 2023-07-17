#include <cs50.h>
#include <stdio.h>

void draw(int n);

int main(void)
{
    // Get height of pyramid
    int height = get_int("Height: ");

    // Draw pyramid
    draw(height);
}

void draw(int n)
{
    // If nothing to draw
    if (n <= 0)                         //<<<<< keep in mind ("feltölti növekvő változóval az alprogramokat, majd a veremből "kiürülve" fokozatosan rajzol)
    {
        return;
    }

    // Draw pyramid of height n - 1
    draw(n - 1);                        //<<<<< keep in mind ("feltölti növekvő változóval az alprogramokat, majd a veremből "kiürülve" fokozatosan rajzol)

    // Draw one more row of width n
    for (int i = 0; i < n; i++)
    {
        printf("#");
    }
    printf("\n");
}