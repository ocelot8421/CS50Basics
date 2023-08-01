# # 1.)
# print("1.)")

# from cs50 import get_int

# x = get_int("x: ")
# y = get_int("y: ")


# if x < y:
#     print("x is less than y")
# elif x > y:
#     print("x is not less than y")
# else:
#     print("x is equal to y")

# ------------------------------------------
##2.)
s = input("Do you agree? ")

# if s == 'Y' or s == "y": #in PYthon there are no chars
# if s in ["Y", 'y', 'yes', "Yes", 'YES', "YeS"]:
if s.lower() in ['y', "yes"]:
    print("Agreed.")
elif s.lower() in ["n", "no"]:
    print("Not agreed.")

# Procedurális programming: változó van átadva function-öknek
# Objec Oriented programming: "változó" (object) saját funkcióit használja

##2a)
s = input("Do you agree? ")
s = s.lower()         #string is immutable in Python, lower() make  copy of s, but by redefining s, the old version of string frees up by Python
if s in ['y', "yes"]:
    print("Agreed.")
elif s in ["n", "no"]:
    print("Not agreed.")

