#include <cs50.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);
double average(int counted, int words);

const double mult_letters = 0.0588;
const double mult_sentences = 0.296;
const double final_subtraction = 15.8;

int main(void)
{
    string text = get_string("Text: ");

    int words_sum = count_words(text);

    int letters_sum = count_letters(text);
    double letters_avg = average(letters_sum, words_sum);

    int sentences_sum = count_sentences(text);
    double sentences_avg = average(sentences_sum, words_sum);

    double index_double =
        mult_letters * letters_avg -
        mult_sentences * sentences_avg -
        final_subtraction;
    int index = round(index_double);

    // Feedback per index
    if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (1 <= index && index < 16)
    {
        printf("Grade %i\n", index);
    }
    else if (16 <= index)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Something is wrong... \n");
    }

}

// Counts letters in the input.
// Checks the characters if their value
// between lowercase/uppercase alphabet ascii caracters.
int count_letters(string text)
{
    int letters_sum = 0;
    int length = strlen(text);
    for (int i = 0; i < length; i++)
    {
        char ascii = text[i];
        if (('a' <= ascii && ascii <= 'z') || ('A' <= ascii && ascii <= 'Z'))
        {
            letters_sum++;
        }
    }
    return letters_sum;
}

// Counts words int hte input.
// Assumes the input always cointans at least one word
// and there are only one whitespace between two words.
int count_words(string text)
{
    int words_sum = 1;
    int length = strlen(text);
    for (int i = 0; i < length; i++)
    {
        char ascii = text[i];
        if (' ' == ascii)
        {
            words_sum++;
        }
    }
    return words_sum;
}

// Count sentences. Assumes that every period is at end of sentences.
int count_sentences(string text)
{
    int sentences_sum = 0;
    int length = strlen(text);
    for (int i = 0; i < length; i++)
    {
        char ascii = text[i];
        if (ascii == '.' || ascii == '!' || ascii == '?')
        {
            sentences_sum++;
        }
    }
    return sentences_sum;
}

// Count average per 100 words
double average(int counted, int words)
{
    return (double) counted / words * 100;   // Per 100 words
}