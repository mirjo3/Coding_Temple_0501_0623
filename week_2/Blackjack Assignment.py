import random

class Deck:
    def __init__(self):
        self.suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
        self.cards = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
        self.values = {'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'10':10,'J':10,'Q':10,'K':10,'A':11}
        self.play_deck = self.get_deck()

    def get_deck(self):
        """Create a new deck of cards and return it"""
        return [(card, suit, self.values[card]) for suit in self.suits for card in self.cards]

    def shuffle_deck(self):
        """Shuffle the deck of cards"""
        random.shuffle(self.play_deck)

class Player:
    def __init__(self, name):
        self.hand = []
        self.score = 0
        self.name = name

    def add_card(self, card):
        self.hand.append(card)
        self.score += card[2]

    def display_hand(self):
        return ', '.join(f"{card[0]} of {card[1]}" for card in self.hand)

    def bust(self):
        return self.score > 21

    def blackjack(self):
        return self.score == 21

    def win(self):
        print(f"{self.name} wins!")

class Human(Player):
    def __init__(self, name="Player"):
        super().__init__(name)

    def __str__(self):
        return self.name

class Dealer(Player):
    def __init__(self, name="Dealer"):
        super().__init__(name)

    def deal_hand(self, deck, player):
        for _ in range(2):
            player.add_card(deck.play_deck.pop())
        self.calculate_score()

    def hit(self, deck, player):
        player.add_card(deck.play_deck.pop())
        self.calculate_score()

    def show_hand(self):
        # Dealer hand
        return self.hand[0]

    def calculate_score(self):
        self.score = sum(card[2] for card in self.hand)

    def __str__(self):
        return self.name

class Game:
    def __init__(self, dealer, human):
        self.dealer = dealer
        self.human = human

    def victory(self):
        self.human.win()

    def push(self):
        print("Push.")

    def defeat(self):
        self.dealer.win()

def main():
    # Create class instances
    deck = Deck()
    dealer = Dealer()
    human = Human()
    game = Game(dealer, human)

    # Ask the player how many decks they want to use
    num_decks = int(input("How many decks do you want to use? "))
    print(num_decks, "decks are being played.")
    deck.play_deck *= num_decks

    # Shuffle the deck
    deck.shuffle_deck()

    # Deal the initial cards
    dealer.deal_hand(deck, human)

    # Game loop
    while True:
        # Show player's hand
        print("Your hand:", human.display_hand())

        # Ask the player if they want a hit
        if input("Do you want a hit? (yes/no) ").lower() == "yes":
            dealer.hit(deck, human)

        else:  # Player stands
            # Dealer takes cards while their score is less than 16
            while dealer.score < 16:
                dealer.add_card(deck.play_deck.pop())

            # Compare scores and display result
            if human.bust():
                print("You busted!")
                game.defeat()
                break
            elif dealer.bust() or human.score > dealer.score:
                game.victory()
                break
            elif human.score < dealer.score:
                game.defeat()
                break
            else:  # human.score == dealer.score
                game.push()
                break

    # Ask the player if they want to play again
    play_again = input("Do you want to play again? (yes/no) ").lower()
    if play_again == "yes" or play_again == "y":
        main()
main()
