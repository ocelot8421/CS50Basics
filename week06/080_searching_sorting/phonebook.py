#  people = dict()
people = {
    "Carter": "+-617-495-1000",
    "David": "+1-949-468-2750"
 }

name = input("Name: ")
if name in people:
    # print(f"Number: {people[name]}")
    number = people[name]
    print(f"Number: {number}")

# dictionary is like hashtable