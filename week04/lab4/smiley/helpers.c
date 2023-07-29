#include "helpers.h"
#include <stdio.h>

void colorize(int height, int width, RGBTRIPLE image[height][width])
{
    // Change all black pixels to a color of your choosing
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            RGBTRIPLE* pixel = &image[i][j];
            // printf("%p %p\n", pixel, &image[i][j]);

            if (pixel->rgbtRed == 0x00 && pixel->rgbtGreen == 0x00 && pixel->rgbtBlue == 0x00)
            {

                // image[i][j].rgbtRed = 0x75;
                pixel->rgbtRed = 0x75;            // <<< keep in mind: pointerrel módosítani struct-ban lévő argumentumot (-> jel)
                // image[i][j].rgbtGreen = 0xa8;
                pixel->rgbtGreen = 0xa8;
                // image[i][j].rgbtBlue = 0x87;
                pixel->rgbtBlue = 0x87;
            }
            printf("%-2x %-2x ", image[i][j].rgbtRed, pixel->rgbtRed);
            printf("%-2x %-2x ", image[i][j].rgbtGreen, pixel->rgbtGreen);
            printf("%-2x %-2x | ", image[i][j].rgbtBlue, pixel->rgbtBlue);
        }
        printf("\n");

    }
}
