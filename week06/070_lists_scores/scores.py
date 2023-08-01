# # 1.)

# scores = [72, 73, 33]   #square brackets for lists in Python (not curly)

# average = sum(scores) / len(scores)
# print(f"Average: {average}")
# -----------------------------------
# 2.)
from cs50 import get_int

# scores = list()
scores = []
for i in range(3):
    score = get_int("Score: ")
    # scores.append(score)
    scores += [score]

average = sum(scores) / len(scores)
print(f"Average: {average}")
