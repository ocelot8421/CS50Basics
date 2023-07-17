#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

bool isAlphabetical(string key);
bool isLettersOnlyOnce(string key);
string encrypt(string key, string text);

const int keyLength = 26;

int main(int argc, string argv[])
{
    // Counts argumentums
    if (argc != 2)
    {
        printf("Usage: ./substitution key");
        return 1;
    }

    // Key validation
    const string key = argv[1];
    if (strlen(key) != keyLength || !isAlphabetical(key) || !isLettersOnlyOnce(key))
    {
        printf("Key must contain 26 characters.\n");
        return 1;
    }

    // Prompts the input from the user
    string text = get_string("plaintext: ");
    text = encrypt(key, text);
    printf("ciphertext: %s\n", text);

    return 0;
}

// Checks the key is alphabetical, does not cointain numbers, etc.
// Returned type is boolean.
bool isAlphabetical(string key)
{
    for (int i = 0; i < keyLength; i++)
    {
        if (!isalpha(key[i]))
        {
            return false;
        }
    }
    return true;
}

// Checks if every letters are contained once in the key.
// If a letter is repeated the program print out the letter and where it is found in the array.

bool isLettersOnlyOnce(string key)
{

    for (int i = 0; i < keyLength; i++)
    {
        for (int j = i + 1; j < keyLength; j++)
        {
            if (toupper(key[i]) == toupper(key[j]))
            {
                printf("repeating letters in key: \n %c: key[%i], %c: key[%i]\n", key[i], i, key[j], j);
                return false;
            }
        }
    }
    return true;
}

// Encryptes the input text. Case is preserved.
// Returned type is string
string encrypt(string key, string text)
{
    int length = strlen(text);
    int index;
    string result = text;

    for (int i = 0; i < length; i++)
    {
        char ch = text[i];
        if (isupper(ch))
        {
            index = ch - 'A';
            result[i] = toupper(key[index]);
        }
        else if (islower(ch))
        {
            index = ch - 'a';
            result[i] = tolower(key[index]);
        }
    }
    return result;
}