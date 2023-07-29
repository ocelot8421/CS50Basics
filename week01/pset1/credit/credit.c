#include <cs50.h>
#include <stdio.h>

int main(void)
{
    //Prompt for credit card number
    long number = get_long("Number: ");

    //Check the number's length
    string card_name = "INVALID\n";
    int sum = 0;
    int length = 0;
    int digit;
    int digit_first = -1;
    int digit_second = -1;

    //Get the digit of number
    while (number > 0)
    {
        //Increase the length of number
        length++;

        //Select the last digit of decreased number
        digit = number % 10;

        //Select the first and second digit
        if (number < 10)
        {
            digit_first = digit;
        }
        else if (number < 100)
        {
            digit_second = digit;
        }

        //Snap down the last digit from number
        number = (number - digit) / 10;

        //Check digit's parity
        if (length % 2 == 0)
        {
            digit *= 2;
        }

        //Increase sum
        sum += (digit - digit % 10) / 10 + digit % 10;
    }

    //Sum's last digit
    int sum_last = sum % 10;

    //If valid, print the type of card
    if (length == 15 && sum_last == 0 && digit_first == 3 && (digit_second == 4 || digit_second == 7))
    {
        card_name = "AMEX\n";
    }
    else if (length == 16 && sum_last == 0 && digit_first == 5 && (0 < digit_second && digit_second < 6))
    {
        card_name = "MASTERCARD\n";
    }
    else if ((length == 16 || length == 13) && sum_last == 0 && digit_first == 4)
    {
        card_name = "VISA\n";
    }

    //Print validation
    printf("%s", card_name);
}