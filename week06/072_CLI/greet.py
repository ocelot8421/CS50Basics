from sys import argv
# ------------------------------
print("1.)")

if len(argv) == 2:
    print(f"hello, {argv[1]}")
else:
    print("hello, world")

# python greet.py Béla

# -------------------------------
print("2.)")

for i in range(len(argv)):
    print(argv[i])


print("2.1.)")

for arg in argv:
    print(arg)

# -----------------------------
print("3.)")

for arg in argv[1:2]:
    print(arg)


