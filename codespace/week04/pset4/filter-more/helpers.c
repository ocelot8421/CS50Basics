#include "helpers.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    BYTE  rgbtBlue;
    BYTE  rgbtGreen;
    BYTE  rgbtRed;
    int   mark;
} __attribute__((__packed__))
RGBmarked;

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    // Outer loop iterating on column of rows
    for (int i = 0; i < height; i++)
    {
        // Inner loop iterating on row of pixels
        for (int j = 0; j < width; j++)
        {
            image[i][j].rgbtRed = (int) round((image[i][j].rgbtRed + image[i][j].rgbtGreen + image[i][j].rgbtBlue) / 3.0);
            image[i][j].rgbtGreen = image[i][j].rgbtRed;
            image[i][j].rgbtBlue = image[i][j].rgbtRed;
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    // Temporary helper image array
    RGBmarked temp_img[height][width];

    // Outer loop to copy image to the middle of temp image
    for (int i = 0; i <= height - 1; i++)
    {
        // Inner loop to copy image to the middle of temp image
        for (int j = 0; j <= width - 1; j++)
        {
            temp_img[i][j].rgbtRed = image[i][width - 1 - j].rgbtRed;
            temp_img[i][j].rgbtGreen = image[i][width - 1 - j].rgbtGreen;
            temp_img[i][j].rgbtBlue = image[i][width - 1 - j].rgbtBlue;
        }
    }
    for (int i = 0; i <= height - 1; i++)
    {
        for (int j = 0; j <= width - 1; j++)
        {
            image[i][j].rgbtRed = temp_img[i][j].rgbtRed;
            image[i][j].rgbtGreen = temp_img[i][j].rgbtGreen;
            image[i][j].rgbtBlue = temp_img[i][j].rgbtBlue;
        }
    }
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    // Helper image arrays
    RGBmarked temp_img[height + 2][width + 2];
    RGBmarked temp2_img[height + 2][width + 2];

    // Clear garbage data (fill the canva with nul)
    for (int i = 0; i < height + 2; i++)
    {
        // Inner loop to clear
        for (int j = 0; j < width + 2; j++)
        {
            temp_img[i][j].mark = -1;
            temp2_img[i][j].mark = -1;
        }
    }

    // Copy images with black(nul) frame
    for (int i = 1; i <= height; i++)
    {
        // Inner loop to copy
        for (int j = 1; j <= width; j++)
        {
            temp_img[i][j].mark = 0;
            temp_img[i][j].rgbtRed = image[i - 1][j - 1].rgbtRed;
            temp_img[i][j].rgbtGreen = image[i - 1][j - 1].rgbtGreen;
            temp_img[i][j].rgbtBlue = image[i - 1][j - 1].rgbtBlue;
        }
    }

    // Outer loop itarating on column of rows
    for (int i = 1; i <= height + 1; i++)
    {
        // Inner loop itarating on row of pixels
        for (int j = 1; j <= width + 1; j++)
        {
            double pixRed = 0;
            double countRed = 0;
            double pixGreen = 0;
            double countGreen = 0;
            double pixBlue = 0;
            double countBlue = 0;

            // Outer loop itarating 3x3 matrix
            for (int k = i - 1, m = i + 1; k <= m; k++)
            {
                // Inner loop itarating 3x3 matrix
                for (int l = j - 1, n = j + 1; l <= n; l++)
                {
                    // Filters the black frame
                    if (temp_img[k][l].mark != -1)
                    {
                        pixRed += temp_img[k][l].rgbtRed;
                        pixGreen += temp_img[k][l].rgbtGreen;
                        pixBlue += temp_img[k][l].rgbtBlue;
                        countRed += 1;
                        countGreen += 1;
                        countBlue += 1;
                    }
                }
            }
            // Give the value to the pixels
            temp2_img[i][j].rgbtRed = (int) round(pixRed / countRed);
            temp2_img[i][j].rgbtGreen = (int) round(pixGreen / countGreen);
            temp2_img[i][j].rgbtBlue = (int) round(pixBlue / countBlue);

            // Empty helper variables
            pixRed = 0;
            pixGreen = 0;
            pixBlue = 0;
            countRed = 0;
            countGreen = 0;
            countBlue = 0;
        }
    }

    // Copy images with black(nul) frame
    for (int i = 0; i <= height - 1; i++)
    {
        for (int j = 0; j <= width - 1; j++)
        {
            image[i][j].rgbtRed = temp2_img[i + 1][j + 1].rgbtRed;
            image[i][j].rgbtGreen = temp2_img[i + 1][j + 1].rgbtGreen;
            image[i][j].rgbtBlue = temp2_img[i + 1][j + 1].rgbtBlue;
        }
    }

    return;
}

// Detect edges ---------------------------------------------------------------------------------
void edges(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE temp_img[height + 2][width + 2];
    RGBTRIPLE temp2_img[height + 2][width + 2];

    // Clear garbage data (fill the canva with nul)
    for (int i = 0; i < height + 2; i++)
    {
        for (int j = 0; j < width + 2; j++)
        {
            temp_img[i][j].rgbtRed = 0;
            temp_img[i][j].rgbtGreen = 0;
            temp_img[i][j].rgbtBlue = 0;
        }
    }

    // Copy images with black(nul) frame
    for (int i = 1; i < height + 1; i++)
    {
        for (int j = 1; j < width + 1; j++)
        {
            temp_img[i][j].rgbtRed = image[i - 1][j - 1].rgbtRed;
            temp_img[i][j].rgbtGreen = image[i - 1][j - 1].rgbtGreen;
            temp_img[i][j].rgbtBlue = image[i - 1][j - 1].rgbtBlue;
        }
    }

    // Outer loop itarating on column of rows
    for (int i = 1; i <= height; i++)
    {
        // Inner loop itarating on row of pixels
        for (int j = 1; j <= width; j++)
        {
            // Red value before square root
            double Gx_red =
                - 1.0 * temp_img[i - 1][j - 1].rgbtRed + 1.0 * temp_img[i - 1][j + 1].rgbtRed
                - 2.0 * temp_img[i + 0][j - 1].rgbtRed + 2.0 * temp_img[i + 0][j + 1].rgbtRed
                - 1.0 * temp_img[i + 1][j - 1].rgbtRed + 1.0 * temp_img[i + 1][j + 1].rgbtRed;
            double Gy_red =
                - 1.0 * temp_img[i - 1][j - 1].rgbtRed - 2.0 * temp_img[i - 1][j + 0].rgbtRed - 1.0 * temp_img[i - 1][j + 1].rgbtRed
                + 1.0 * temp_img[i + 1][j - 1].rgbtRed + 2.0 * temp_img[i + 1][j + 0].rgbtRed + 1.0 * temp_img[i + 1][j + 1].rgbtRed;
            double sq_red = pow(Gx_red, 2) + pow(Gy_red, 2);

            // Green value before square root
            double Gx_green =
                - 1.0 * temp_img[i - 1][j - 1].rgbtGreen + 1.0 * temp_img[i - 1][j + 1].rgbtGreen
                - 2.0 * temp_img[i + 0][j - 1].rgbtGreen + 2.0 * temp_img[i + 0][j + 1].rgbtGreen
                - 1.0 * temp_img[i + 1][j - 1].rgbtGreen + 1.0 * temp_img[i + 1][j + 1].rgbtGreen;
            double Gy_green =
                - 1.0 * temp_img[i - 1][j - 1].rgbtGreen - 2.0 * temp_img[i - 1][j + 0].rgbtGreen - 1.0 * temp_img[i - 1][j + 1].rgbtGreen
                + 1.0 * temp_img[i + 1][j - 1].rgbtGreen + 2.0 * temp_img[i + 1][j + 0].rgbtGreen + 1.0 * temp_img[i + 1][j + 1].rgbtGreen;
            double sq_green = pow(Gx_green, 2) + pow(Gy_green, 2);

            // Blue value before square root
            double Gx_blue =
                - 1.0 * temp_img[i - 1][j - 1].rgbtBlue + 1.0 * temp_img[i - 1][j + 1].rgbtBlue
                - 2.0 * temp_img[i + 0][j - 1].rgbtBlue + 2.0 * temp_img[i + 0][j + 1].rgbtBlue
                - 1.0 * temp_img[i + 1][j - 1].rgbtBlue + 1.0 * temp_img[i + 1][j + 1].rgbtBlue;
            double Gy_blue =
                - 1.0 * temp_img[i - 1][j - 1].rgbtBlue - 2.0 * temp_img[i - 1][j + 0].rgbtBlue - 1.0 * temp_img[i - 1][j + 1].rgbtBlue
                + 1.0 * temp_img[i + 1][j - 1].rgbtBlue + 2.0 * temp_img[i + 1][j + 0].rgbtBlue + 1.0 * temp_img[i + 1][j + 1].rgbtBlue;
            double sq_blue = pow(Gx_blue, 2) + pow(Gy_blue, 2);

            // Copy pixels into original image without black frame
            temp2_img[i][j].rgbtRed = (int) round(sqrt(sq_red));
            temp2_img[i][j].rgbtGreen = (int) round(sqrt(sq_green));
            temp2_img[i][j].rgbtBlue = (int) round(sqrt(sq_blue));

            // Reduce values to maximum 255
            if ((int) round(sqrt(sq_red)) > 255)
            {
                temp2_img[i][j].rgbtRed = 255;
            }
            if ((int) round(sqrt(sq_green)) > 255)
            {
                temp2_img[i][j].rgbtGreen = 255;
            }
            if ((int) round(sqrt(sq_blue)) > 255)
            {
                temp2_img[i][j].rgbtBlue = 255;
            }
        }
    }

    // Copy modified pixels back their original places
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            image[i][j].rgbtRed = temp2_img[i + 1][j + 1].rgbtRed;
            image[i][j].rgbtGreen = temp2_img[i + 1][j + 1].rgbtGreen;
            image[i][j].rgbtBlue = temp2_img[i + 1][j + 1].rgbtBlue;
        }
    }
    return;
}