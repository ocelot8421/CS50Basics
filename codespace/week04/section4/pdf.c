#include <cs50.h>
#include <stdint.h>
#include <stdio.h>

int main(int argc, string argv[])
{
    // Check if the argument are given
    if (argc != 2)
    {
        printf("Usage: ./pdf input.pdf\n");
        return 1;
    }


    // Open file
    string filename = argv[1];
    FILE* input = fopen(filename, "r");

    //Check if the file exist
    if (input == NULL)
    {
        printf("No such file found.\n");    // here input is null, so there is nothing to close
        return 1;
    }

    uint8_t buffer[4];
    uint8_t signature[] = {37, 80, 68, 70};

    fread(buffer, 1, 4, input);
    fclose(input);               // free memory 'B' version (close file at one place, data in buffer because of fread();)

    // Does the buffer signature match?
    for (int i = 0; i < 4; i++)
    {
        if (buffer[i] != signature[i])
        {
            printf("Likely not a PDF.\n");
            // fclose(input);      // free memory 'A' version (close file at two place in this case)
            return 0;
        }
    }
    printf("Likely a PDF!\n");
    // fclose(input);              // free memory 'A' version (close file at two place in this case)
    return 0;
}