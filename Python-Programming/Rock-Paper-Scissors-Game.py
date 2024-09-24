import random

# Function to play one round of Rock Paper Scissors
def play_round(player_choice):
    choices = ['Rock', 'Scissors', 'Paper']
    computer_choice = random.choice(choices)

    # Show what the player and computer chose
    print(f'You chose: {player_choice}')
    print(f'Computer chose: {computer_choice}')

    # Define the rules for winning and losing
    if player_choice == computer_choice:
        return "It's a draw", 0
    elif (player_choice == 'Rock' and computer_choice == 'Scissors') or \
         (player_choice == 'Scissors' and computer_choice == 'Paper') or \
         (player_choice == 'Paper' and computer_choice == 'Rock'):
        return "You win", 1
    else:
        return "You lose", -1

# Main game function
def play_game():
    print("Welcome to the Rock Paper Scissors Game!")
    player_name = input("Please enter your name: ")  # Input player name

    player_score = 0
    computer_score = 0
    target_score = 10

    while player_score < target_score and computer_score < target_score:
        print("\nChoose your option: Rock, Scissors, Paper (or type 'quit' to exit the game)")
        player_choice = input("Your choice: ").strip()

        if player_choice.lower() == 'quit':
            print(f"\n{player_name}, you chose to quit the game.")
            print(f"Final Score: {player_name} {player_score}, Computer {computer_score}")

            # Determine who is winning when quitting
            if player_score > computer_score:
                print(f"{player_name} is winning!")
            elif computer_score > player_score:
                print("The computer is winning!")
            else:
                print("It's a tie!")

            print("Thanks for playing!")
            break

        if player_choice not in ['Rock', 'Scissors', 'Paper']:
            print("Invalid choice. Please choose again.")
            continue

        result, score = play_round(player_choice)
        if result == "You win":
            player_score += 1
        elif result == "You lose":
            computer_score += 1

        print(f'{result}! Your score: {player_score}, Computer score: {computer_score}')

    if player_score == target_score:
        print(f'Congratulations {player_name}, you won the game with a score of {player_score} to {computer_score}!')
    elif computer_score == target_score:
        print(f'Sorry {player_name}, you lost. The computer won with a score of {computer_score} to {player_score}.')

# Function to start the game loop
def start_game():
    while True:
        play_game()
        # Ask the player if they want to play again
        play_again = input("Do you want to play again? (yes/no): ").strip().lower()
        if play_again == 'no':
            print("Thank you for playing! Goodbye!")
            break
        elif play_again == 'yes':
            print("Starting a new game...")
        else:
            print("Invalid input. Exiting the game.")
            break

# Start the game
start_game()
