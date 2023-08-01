words = set() #set implemets a hashtable

def check(word):
    # if word in words:
    if word.lower() in words:   #case-insensable
        return True
    else:
        return False

def load(dictionary):
    file = open(dictionary, "r")
    # for line in file:
    #     words.add(line)
    for line in file:
        word = line.rstip() #get rid of \n at the end of line
        words.add(word)
    close(file)
    return True

def size():
    return len(words)

def unload():
    return True