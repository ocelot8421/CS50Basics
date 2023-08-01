import csv

# -----------------------------
print("1.)")

file = open("phonebook.csv", "a") #append (not write9)

name = input("Name: ")
number = input("Number: ")

writer = csv.writer(file)
writer.writerow([name, number])

file.close()

# ---------------------------------
print("2.)")

with open("phonebook.csv", "a") as file:

    number = input("Number: ")
    name = input("Name: ")

    # writer = csv.writer(file) # static order
    # writer.writerow([name, number])
    writer = csv.DictWriter(file, fieldnames=["name", "number"]) # dynamic order (switchable columns)
    writer.writerow({"name": name, "number": number}) # static order

# ---------------------------------
