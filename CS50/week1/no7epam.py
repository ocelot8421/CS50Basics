import random
import itertools


COLORS = ["Hearts", "Diamonds", "Clubs", "Spades"]
RANKS = ["Jack", "Queen", "King", "Ace"]
NUMBERS = [str(number) for number in range(2, 11)]




DECK = [f"{item[0]} of {item[1]}" for item in itertools.permutations(NUMBERS + RANKS +  COLORS)]




def deal(count):
    global DECK
    hand = random.choices(DECK, k=count)
    print(hand)
    DECK = list(set(DECK) - set(hand))
    print(DECK)
    return hand


player1_hand = deal(5)
player2_hand = deal(5)
player3_hand = deal(5)
player4_hand = deal(5)


