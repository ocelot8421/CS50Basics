from cs50 import get_string

print("1.)")
print("hello, world")

print("2.)")
answer = get_string("What's your name? ") #import cs50 get_string func
print("hello, " + answer)
print("hello,", answer) #without space
print(f"hello, {answer}") #with curly braces