#include <stdio.h>

int main(void)
{
    // Scores
    int score1 = 72;
    int score2 = 73;
    int score3 = 33;

    // Print average
    // printf("Average: %f\n", (score1 + score2 + score3) / 3.0);   // same result
    printf("Average: %f\n", (score1 + score2 + score3) / (float) 3);
}