// BMP-related data types based on Microsoft's own

#include <stdint.h>

// These data types are essentially aliases for C/C++ primitive data types.
// Adapted from http://msdn.microsoft.com/en-us/library/cc230309.aspx.
// See https://en.wikipedia.org/wiki/C_data_types#stdint.h for more on stdint.h.

typedef uint8_t   BYTE;
typedef uint16_t  WORD;
typedef uint32_t  DWORD;

// The WAVHEADER structure contains information about the type, size,
// and layout of a file that contains audio samples.
// Adapted from http://soundfile.sapp.org/doc/WaveFormat/.

typedef struct
{
    BYTE   chunkID[4];          // 4 *  8 bits = 32 bits    (0-3)   1.1.1   00000000
    DWORD  chunkSize;           // 1 * 32 bits = 32 bits    (4-7)   1.1.2   00000004
    BYTE   format[4];           // 4 *  8 bits = 32 bits    (8-11)  1.2     00000008
    BYTE   subchunk1ID[4];      // 4 *  8 bits = 32 bits   (12-15)  2.1.1   0000000C
    DWORD  subchunk1Size;       // 1 * 32 bits = 32 bits   (16-19)  2.1.2   00000010
    WORD   audioFormat;         // 1 * 16 bits = 16 bits   (20-21)  2.2    00000014
    WORD   numChannels;         // 1 * 16 bits = 16 bits   (22-23)  2.3    00000014
    DWORD  sampleRate;          // 1 * 32 bits = 32 bits   (24-27)  2.4     00000018
    DWORD  byteRate;            // 1 * 32 bits = 32 bits   (28-31)  2.5     0000001C
    WORD   blockAlign;          // 1 * 16 bits = 16 bits   (32-33)  2.6    00000020
    WORD   bitsPerSample;       // 1 * 16 bits = 16 bits   (34-35)  2.7    00000020
    BYTE   subchunk2ID[4];      // 4 *  8 bits = 32 bits   (36-39)  3.1.1   00000024
    DWORD  subchunk2Size;       // 1 * 32 bits = 32 bits   (40-43)  3.1.2   00000028
} __attribute__((__packed__))
WAVHEADER;