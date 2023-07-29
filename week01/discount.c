#include <cs50.h>
#include <stdio.h>

// float discount(float price);
float discount(float price, int percent_off);

int main(void)
{
    // // Without discount function
    // float regular = get_float("Regular Price: ");
    // float sale = regular * .85;
    // printf("Sale Price: %.2f\n", sale);

    // // Discount function with one input
    // float regular = get_float("Regular Price: ");
    // float sale = discount(regular);
    // printf("Sale Price: %.2f\n", sale);

    // // Discount function with more than one inputs
    float regular = get_float("Regular Price: ");
    int percent_off = get_int("Percent Off: ");
    float sale = discount(regular, percent_off);
    printf("Sale Price: %.2f\n", sale);
}

float discount(float price, int percent_off)
{
    // float sale = price * .85;
    // return sale;

    // return price * .85;

    return price * (100 - percent_off) / 100;
}