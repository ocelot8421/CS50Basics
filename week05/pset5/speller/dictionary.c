// Implements a dictionary's functionality

#include <ctype.h>
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
} node;

// TODO: Choose number of buckets in hash table
const unsigned int N = 810000;
const unsigned int powN = 4; // N = 30 ^ n

// Hash table
node *table[N];

char wordDic[LENGTH + 1];

void printHashTable(node *linkedListNode);
bool searchLinkedList(node *headNode, const char *word);
unsigned int countNode(node *nodeCount, unsigned int sizeCounter);
void clear(node *tableNode);

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // TODO
    unsigned int hsh = hash(word);
    if (table[hsh] == NULL)
    {
        return false;
    }
    return searchLinkedList(table[hsh], word);
}

// Hashes word to a number
unsigned int hash(const char *word)
{
    // TODO: Improve this hash function
    char ch;
    unsigned long mult = 1;
    char chIndex;
    unsigned int hashCode = 0;
    int n = powN;
    if (strlen(word) < powN)
    {
        n = strlen(word);
    }
    for (int i = 0; i < n; i++)
    {
        ch = tolower(word[i]);
        if ('a' <= ch && ch <= 'z')
        {
            chIndex = ch - 'a' + 1;
        }
        if (ch == '\'')
        {
            chIndex = 27; // a = 1, z = 26
        }
        hashCode += chIndex * mult;
        mult *= 30;
    }
    mult = 1;
    return hashCode;
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{

    // TODO
    FILE *infile = fopen(dictionary, "r");
    if (infile == NULL)
    {
        return false;
    }
    unsigned int hashCode = 0;
    while (fscanf(infile, "%s", wordDic) == 1)
    {
        hashCode = hash(wordDic);
        if (table[hashCode] == NULL)
        {
            table[hashCode] = malloc(sizeof(node));
            table[hashCode]->next = NULL;
            for (int i = 0, n = LENGTH + 1; i < n; i++)
            {
                table[hashCode]->word[i] = 0;
            }
            for (int i = 0, n = strlen(wordDic); i < n; i++)
            {
                table[hashCode]->word[i] = wordDic[i];
            }
        }
        else
        {
            node *new = malloc(sizeof(node));
            new->next = NULL;
            for (int i = 0, n = LENGTH + 1; i < n; i++)
            {
                new->word[i] = 0;
            }
            for (int i = 0, n = strlen(wordDic); i < n; i++)
            {
                new->word[i] = wordDic[i];
            }
            new->next = table[hashCode];
            table[hashCode] = new;
        }

        // To print content of hash table:
        // printf("%u\n", hashCode);
        // printHashTable(table[hashCode]);
        hashCode = 0;
    }
    fclose(infile);
    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    unsigned int sizeCounter = 0;
    for (int i = 0; i < N; i++)
    {
        if (table[i] != NULL)
        {
            sizeCounter = countNode(table[i], sizeCounter);
        }
    }
    return sizeCounter;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // TODO
    for (int i = 0; i < N; i++)
    {
        clear(table[i]);
    }
    return table[N - 1] == NULL;
}

// print hash table
void printHashTable(node *linkedListNode)
{
    if (linkedListNode == NULL)
    {
        printf("- null\n\n");
        printf("- %p - ", linkedListNode);
        return;
    }
    printf("- %p - ", linkedListNode);
    printf("- %s\n", linkedListNode->word);
    if (linkedListNode->next == NULL)
    {
        printf("\n");
        return;
    }
    printHashTable(linkedListNode->next);
}

bool searchLinkedList(node *headNode, const char *word)
{

    if (strcasecmp(headNode->word, word) == 0)
    {
        return true;
    }
    if (headNode->next == NULL)
    {
        return false;
    }
    return searchLinkedList(headNode->next, word);
}

unsigned int countNode(node *nodeCount, unsigned int sizeCounter)
{
    sizeCounter++;
    if (nodeCount->next != NULL)
    {
        sizeCounter = countNode(nodeCount->next, sizeCounter);
    }
    return sizeCounter;
}

void clear(node *tableNode)
{
    if (tableNode == NULL)
    {
        free(tableNode);
    }
    else
    {
        clear(tableNode->next);
        free(tableNode);
    }
    return;
}