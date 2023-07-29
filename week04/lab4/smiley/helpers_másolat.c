#include "helpers.h"
#include <stdio.h>

void colorize(int height, int width, RGBTRIPLE image[height][width])
{
    // The outer loop iterate on the column of raws
    for (int i = 0; i < height; i++)
    {
        // The inner loop iterate on the row of pixels
        for (int j = 0; j < width; j++)
        {
            if (image[i][j].rgbtRed == 0x00 && image[i][j].rgbtGreen == 0x00 && image[i][j].rgbtBlue == 0x00)
            {
                image[i][j].rgbtRed = 0x75;
                image[i][j].rgbtGreen = 0xa8;
                image[i][j].rgbtBlue = 0x87;
            }
        }
    }
}
