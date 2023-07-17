#include <cs50.h>
#include <stdio.h>

int main(void)
{
    //float GROW_PACE = (float) 1 +  (float) 1 / (float) 3; //1.333333
    //float GROW_PACE = 1 +  (float) 1 / (float) 3;         //1.333333
    //float GROW_PACE = 1 +  (float) 1 / 3;                 //1.333333
    //float GROW_PACE = (float) 1 + 1 / 3;                  //1.000000
    float GROWTH_RATE = 1 / (float) 3;                    //1.333333
    float DECLINE_PACE = 1 / (float) 4;                    //1.333333
    //printf("GROW_PACE: %f\n", DECLINE_PACE);

    // TODO: Prompt for start size
    string question_start = "How many llamas is there at the beginning? Please, enter a number greater than 8. ";
    int num_start = get_int("%s\n", question_start);
    while (num_start < 9) {
        num_start = get_int("%s\n", question_start);
    }

    // TODO: Prompt for end size
    string question_end = "How many llamas would be there at the end? Please, enter a number is not less than at the beginning.";
    int num_end = get_int("%s\n", question_end);
    while (num_end < num_start) {
        num_end = get_int("%s\n", question_end);
    }

    // TODO: Calculate number of years until we reach threshold
    int year = 1;
    printf("year: %i\n", year);
    int born = GROWTH_RATE * num_start;
    printf("born: %i\n", born);
    int passAway = DECLINE_PACE * num_start;
    printf("passAway: %i\n", passAway);
    int sum = num_start + born - passAway;
    printf("sum: %i\n", sum);
    printf("\n");
    while (sum < num_end){
        year++;
        printf("year: %i\n", year);
        born = GROWTH_RATE * sum;
        printf("born: %i\n", born);
        passAway = DECLINE_PACE * sum;
        printf("passAway: %i\n", passAway);
        sum = sum + born - passAway;
        printf("sum: %i\n", sum);
        printf("\n");
    }

    // TODO: Print number of years
    printf("Years: %i\n", year);
}
