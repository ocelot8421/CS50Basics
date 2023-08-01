
import sys

names = ["Bill", "charlie", "Fred", "George", "Ginny", "Percy", "Ron"]

name = input("Name: ")

# -----------------------
# linear search:

# for n in names:
#     if name == n:
if name in names:   # built-in linear search
        print("Found")
        sys.exit(0)

print("Not found")
sys.exit(1)