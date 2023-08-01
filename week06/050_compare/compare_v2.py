print("1.)")

s = input("s: ")
t = input("t: ")


if s == t:
    print("Same")
else:
    print("Different")

# ----------------------
print("2.)")

s2 = input("s2 input: ")
t2 = s2.capitalize()

print(f"s2: {s2}")
print(f"t2: {t2}")

# ----------------------
print("3.)")

s2, t2 = t2, s2

print(f"s2: {s2}")
print(f"t2: {t2}")
