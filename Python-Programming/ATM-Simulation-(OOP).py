class ATM:
    def __init__(self, name, balance, pin):
        """Initializes the ATM with a name, balance, and a PIN"""
        self.name = name
        self.balance = balance
        self.pin = pin
        self.is_logged_in = False

    def login(self, pin):
        """Logs the user in if the PIN is correct"""
        if pin == self.pin:
            self.is_logged_in = True
            print(f"Login successful! Welcome, {self.name}.")
        else:
            print("Incorrect PIN!")

    def check_balance(self):
        """Checks the account balance"""
        if self.is_logged_in:
            print(f"{self.name}, your balance is: {self.balance} THB")
        else:
            print("Please login first!")

    def deposit(self, amount):
        """Deposits money into the account"""
        if self.is_logged_in:
            if amount > 0:
                self.balance += amount
                print(f"{self.name}, you have deposited {amount} THB. Your new balance is {self.balance} THB")
            else:
                print("Amount must be greater than zero!")
        else:
            print("Please login first!")

    def withdraw(self, amount):
        """Withdraws money from the account"""
        if self.is_logged_in:
            if 0 < amount <= self.balance:
                self.balance -= amount
                print(f"{self.name}, you have withdrawn {amount} THB. Your new balance is {self.balance} THB")
            else:
                print("Insufficient funds or invalid amount!")
        else:
            print("Please login first!")

    def change_pin(self, new_pin):
        """Changes the account PIN"""
        if self.is_logged_in:
            self.pin = new_pin
            print(f"{self.name}, your PIN has been successfully changed!")
        else:
            print("Please login first!")

    def transfer(self, amount, recipient):
        """Transfers money to another user's account"""
        if self.is_logged_in:
            if 0 < amount <= self.balance:
                self.balance -= amount
                recipient.balance += amount
                print(f"{self.name}, you have transferred {amount} THB to {recipient.name}.")
                print(f"Your new balance is {self.balance} THB")
            else:
                print("Insufficient funds or invalid amount!")
        else:
            print("Please login first!")

# Example of Method Usage 
## Create two ATM accounts
my_atm = ATM(name="Franc", balance=10000, pin=9999)
recipient_atm = ATM(name="Marry", balance=3000, pin=5555)

## Login to John's account
my_atm.login(9999)

## Deposit money
my_atm.deposit(3000)

## Withdraw money
my_atm.withdraw(1500)

## Check balance before transfer
my_atm.check_balance()

## Transfer money to Marry
my_atm.transfer(2500, recipient_atm)

## Check balance after transfer
my_atm.check_balance()

## Change PIN
my_atm.change_pin(8888)

## Check Marry's balance
recipient_atm.login(5555)
recipient_atm.check_balance()
