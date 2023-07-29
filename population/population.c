#include <cs50.h>
#include <stdio.h>

int main(void)
{
    float GROWTH_RATE = 1 / (float) 3;
    float DECLINE_PACE = 1 / (float) 4;

    // TODO: Prompt for start size
    string question_start = "Start size: ";
    int num_start = get_int("%s", question_start);
    while (num_start < 9)
    {
        num_start = get_int("%s", question_start);
    }

    // TODO: Prompt for end size
    string question_end = "End size: ";
    int num_end = get_int("%s", question_end);
    while (num_end < num_start)
    {
        num_end = get_int("%s", question_end);
    }

    // TODO: Calculate number of years until we reach threshold
    int year = 0;
    if (num_start != num_end)
    {
        year = 1;
    }
    int born = GROWTH_RATE * num_start;
    int passAway = DECLINE_PACE * num_start;
    int sum = num_start + born - passAway;
    while (sum < num_end)
    {
        year++;
        born = GROWTH_RATE * sum;
        passAway = DECLINE_PACE * sum;
        sum = sum + born - passAway;
    }

    // TODO: Print number of years
    printf("Years: %i\n", year);
}
