#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Scores
    int scores[3];
    scores[0] = 72;
    scores[1] = 73;
    scores[2] = 33;

    // Print average
    printf("Average: %f\n", (scores[0] + scores[1] + scores[2]) / 3.0);

    int scores2[] = {72, 73, 33};
    for(int i = 0; i < 3; i++)
    {
        printf("score: %i \n", scores[i]);
    }
}