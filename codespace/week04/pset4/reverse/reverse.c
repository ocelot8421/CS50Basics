#include <cs50.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "wav.h"

int check_format(WAVHEADER header);
int get_block_size(WAVHEADER header);

int main(int argc, char *argv[])
{
    // Ensure proper usage
    if (argc != 3)
    {
        printf("Usage: ./reverse input.wav output.wav\n");
        return 1;
    }

    // Open input file for reading
    string filename = argv[1];
    FILE *input_wav = fopen(filename, "r");
    if (input_wav == NULL)
    {
        printf("File not found.\n");
        return 1;
    }

    // Read header
    WAVHEADER header;
    fread(&header, sizeof(WAVHEADER), 1, input_wav);

    // Use check_format to ensure WAV format
    if (check_format(header) != 0)
    {
        printf("Invalid file format.\n");
        return 1;
    }

    // Open output file for writing
    FILE *output_wav = fopen(argv[2], "w");
    if (output_wav == NULL)
    {
        fclose(output_wav);
        return 1;
    }

    // Write header to file
    fwrite(&header, sizeof(WAVHEADER), 1, output_wav);

    // Use get_block_size to calculate size of block
    int size_of_block = get_block_size(header);

    // Write reversed audio to file
    BYTE block[size_of_block];
    int size_audio = header.subchunk2Size;
    int num_of_blocks = size_audio / size_of_block;
    BYTE array_audio[num_of_blocks][size_of_block];
    int index = 0;
    // Generate a matrix with "size_audio / size_of_block" rows.
    // There are "header.numChannels * header.bitsPerSample / 8" bytes per row.
    while (fread(&block, sizeof(size_of_block), 1, input_wav))
    {
        for (int i = 0; i < size_of_block; i++)
        {
            array_audio[index][i] = block[i];
        }
        index++;
    }
    // Write array to the output wav in reversed order.
    // Maintain the order of samples (right and left channel).
    for (int i = num_of_blocks - 1; i >= 0; i--)
    {
        for (int j = 0; j < size_of_block; j++)
        {
            fwrite(&array_audio[i][j], sizeof(BYTE), 1, output_wav);
        }
    }
    fclose(input_wav);
    fclose(output_wav);
    return 0;
}

// Check the format of output via header.format array == {'W', 'A', 'V', 'E'} equalincy.
int check_format(WAVHEADER header)
{
    uint8_t signature[] = {'W', 'A', 'V', 'E'};
    for (int i = 0; i < 4; i++)
    {
        if (header.format[i] != signature[i])
        {
            return 1;
        }
    }
    return 0;
}

// Get size of a block. IT is neccessary to keep order of right&left channels during reversation.
int get_block_size(WAVHEADER header)
{
    int bytes_per_sample = header.numChannels * header.bitsPerSample / 8;
    return bytes_per_sample;
}