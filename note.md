---

[WEEK02_Lecture_DavidJMalan]
https://cs50.harvard.edu/x/2023/notes/2/

# fájl generálása vs code-dal:

code hello.c

# compile hello:

make hello

# run hello:

./hello

# fordítók:

clang (C Language), gcc
clang hello.c ---> a.out (Assembler Output)
futtatása: ./a.out
(rename: mv a.out hello)
clang -o hello hello.c ---> hello
(def: command line argument -o hello in clang -o hello hello.c)
./hello
clang -o hello hello.c -lcs50 ---> hello (#include <cs50.h>)
l like link

# fordítás 4 fő lépése (\*link1)

1. preprocessing
   '#' (hash mark) = preprocessor directive
   ls /usr/include
   string get_string(string prompt);# function prototype (declaration)
2. compiling
3. assembling
4. linking

# debug

debug50 ./buggy0

# data types:

bool 1 byte 8 bits
uint8_t 1 byte 8 bits \_t = its own type #include <stdint.h>
char 1 byte
int 4 bytes
float 4 bytes
double 8 bytes
long 8 bytes
pointers (int*, char*, string\*,... ) 8 bytes
hexadecimális
double pointer (int**, char**, etc)
string ? bytes

# typecasting:

(72 + 73 + 33) / 3.0 = 59.333333;
(72 + 73 + 33) / (float) 3 = 59.333332;

# arrays: (1:14:53)

- syntactic sugar (1:28:45) +=

# NUL character: //Not the same as NULL pointer (week04, pointers)

\0 (to close a string);
\0 - with slash represent zero as char
HI!\0 ---> 72 73 33 0

# status:

echo $? - the status of the previously executed program

# cipher:

- Caesar chiper

---

[week02_Short_videos_Doug_Lloyd]

# Functions:

- functions, procedures, methods, subroutines

# Variables and Scope:

- local variables, global variables
- local variables in C passed by value (00:02:49)
  BUT!!! not array (they are passed by reference)
- callee: function that calls the variable

# Cli:

int main(argc, argv[]){} ---> argv[0]; arg[argc-1]
./greedy 1024 cs50 ---> 1024 is a string!

---

[week02_ShortVideos_CarterZenke]

# Debugging ("Step into"):

- string equality:
  strcmp(string1, string2) == 0

---

[Lab2]
https://cs50.harvard.edu/x/2023/labs/2/

wget https://cdn.cs50.net/2022/fall/labs/2/scrabble.zip
unzip scrabble.zip
rm scrabble.zip - execute /delete/

---

---

[week03__Lecture_DavidJMalan]

# Running time - worst case: big O

            sorting:            searching:

O(n²) selection sort
bubble sort,
(counting)
O(n\*logn) merge sort
O(n) linear search
O(logn) binary search
O(1)

# Running time - best case: omega

Ω(n²) selection sort, counting
Ω(n\*logn) merge sort
Ω(n) bubble sort
Ω(logn)
Ω(1) linear search, binary search

# Running time - worst and best cases are the same: theta

Θ(n²) selection sort, counting
Θ(n\*logn) merge sort
Θ(n)
Θ(logn)
Θ(1)

# Sort algorithms:

- Selection sort
  (n-1)+(n-2)+(n-3)+...+3+2+1
  n(n-1)/2
  n²/2 - n/2
  O(n²)
- Bubble sort
  (n-1)\*(n-1) (?)
  n²-2n+1
  O(n²)
- Merge sort
  n _ logn
  O(n _ logn)

---

[Lab3]
time ./sort1 reversed10000.txt

---

---

## [week04__Lecture_DavidJMalan]

[Section4_CarterZenke]

<file_handling>

FILE\* input = fopen("hi.txt", "r");
fread(buffer, 1, 3, input);

first four byte(as int) of - File signature:
PDf 37 80 68 70

<dynamic_memory>

[malloc]
int* hours = malloc(sizeof(int) * 5);
_hours = 7; hours[0] = 7;
_(hours + 1) = 9; hours[1] = 9;

- Stack: limited to the single function call
- Heap: can be shared across functions overall; also useful for big data structures to avoid overflow

<MEMORY ERRORS>

- failing to <free> every block of memory which we've <malloc>'d
- failing to <fclose> every file we've <fopen>ed
- using more memory than we've allocated

[valgrind]
make main (compile before!)
valgrind ./main arguments..

https://cdn.cs50.net/2022/fall/sections/4/src4/create.c
invalid write:
char _filename = malloc(sizeof(char) _ filename*length);
v v v
char \_filename = malloc(sizeof(char) * (filename_length + 1));
---> string end with nul(\0), but filename_length just get that without nul end

---

---

[week05__Lecture_DavidJMalan]
Abstract Data Types. Queues, Stacks. Linked Lists. Trees, Binary Search Trees. Hash Tables. Tries.

// Print numbers
node \*ptr = list;
while (ptr != NULL)
{
printf("%i\n", ptr->number);
ptr = ptr->next;
}

V V V V V

for (node \*ptr = list; ptr != NULL; ptr = ptr->next)
{
printf("%i\n", ptr->number);
}

---

[week06]
<Python on local server>
python -m pip install pyttsx3

python -m ensurepip (link2)
python -m ensurepip --user

python speech.py
python3 qr.py

Ctrl+Shift+P / Python: Create enviroment

[wek06_short]
#!/usr/bin/env
chmod a+x <file> -- Linux

[section]
for _ in words: # _ means that the variable doesn't matter we don't use it, just for loop

## input("Title: ").strip().capitalie()

# print between 0 and 1 random double

import random
random.random()

---

[week07_lecture]
python favorites.py | more

scratch, c, python = 0, 0, 0

- sorted
  for favorite in sorted(counts):
  for favorite in sorted(counts, reverse=True):

for favorite in sorted(counts, key=counts[language], reverse=True):
print(f"{favorite}: {counts{favorite}}")

---

\*
link1: https://cs50.harvard.edu/x/2023/notes/2/#:~:text=Compiling%20involves%20major%20steps%2C%20including%20the%20following%3A

link2: https://stackoverflow.com/questions/32639074/why-am-i-getting-importerror-no-module-named-pip-right-after-installing-pip
