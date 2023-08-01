## 1.)

# for i in range(3):
#     print("#")
# -------------------------------
## 2.)  # in Python there is not do-while loop
# from cs50 import get_int

# while True:   # "pythonic" way
#     n = get_int("Height: ")
#     if n > 0:
#         break

# for i in range(n):
#     print("#")
# ----------------------------------
# # 3.)
# from cs50 import get_int

# def main():
#     height = get_height()
#     for i in range(height):
#         print("#")

# def get_height():
#     while True:
#         n = get_int("Height: ")
#         if n > 0:
#             break
#     return n    # no scope (what?O.o)


# 3a.)

# from cs50 import get_int

# def main():
#     height = get_height()
#     for i in range(height):
#         print("#")

#                         # double blank line between functions
# def get_height():
#     while True:
#         n = get_int("Height: ")
#         if n > 0:
#             return n    # no scope (what?O.o)


# main()

# ------------------------------------
# # 4.)

# def main():
#     height = get_height()
#     for i in range(height):
#         print("#")

#                         # double blank line between functions
# def get_height():
#     while True:
#         try:
#             n = int(input("Height: "))
#             if n > 0:
#                 return n    # no scope (what?O.o)
#         except ValueError:
#             print("Not an integer")


# main()



# 4a)

def main():
    height = get_height()
    for i in range(height):
        print("#")


def get_height():
    while True:
        try:
            n = int(input("Height: "))
        except ValueError:
            print("Not an integer")
        else:
            if n > 0:
                return n


main()




