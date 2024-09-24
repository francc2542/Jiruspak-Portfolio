library(tibble)

# Define the menu for pizzas
menu_pizza <- tibble(
  menu = c("Margherita", "Hawaiian", "Vegetarian", "Anchovy and Olives", 
           "Meat Feast", "Pepperoni", "BBQ Chicken", "Smoked Salmon", "Nutella Pizza"),
  price = c(200, 250, 220, 240, 280, 230, 260, 270, 180)
)

# Define the menu for drinks
menu_drinks <- tibble(
  menu = c("Drinking Water", "Coca Cola", "Sprite", "Fanta Orange", "Lemon Ice Tea"),
  price = c(20, 30, 30, 30, 25)
)

# Function to present menu items
present_menu <- function() {
  cat("------- Pizzas -------\n")
  for (i in seq_along(menu_pizza$menu)) {
    cat(i, ". ", menu_pizza$menu[i], ": $", menu_pizza$price[i], "\n")
  }
  cat("\n------- Drinks -------\n")
  for (i in seq_along(menu_drinks$menu)) {
    cat(i + length(menu_pizza$menu), ". ", menu_drinks$menu[i], ": $", menu_drinks$price[i], "\n")
  }
}

# Function to calculate total price
calculate_total <- function(order_indices) {
  total <- 0
  for (index in order_indices) {
    if (index <= length(menu_pizza$menu)) {
      total <- total + menu_pizza$price[index]
    } else {
      total <- total + menu_drinks$price[index - length(menu_pizza$menu)]
    }
  }
  return(total)
}

# Function to interact with user using readline()
pizza_chatbot <- function() {
  cat("Welcome to Our Pizza Restaurant!\n")
  while (TRUE) {
    user_input <- readline("Please type 'menu' to select a menu or 'exit' to quit: ")
    if (tolower(user_input) == "menu") {
      present_menu()
      cat("\nEnter the numbers of the items you'd like to order (separated by commas): ")
      order_input <- readline(prompt = "")
      order_indices <- as.numeric(unlist(strsplit(order_input, ",")))
      
      # Validate user input
      if (any(order_indices < 1 | order_indices > length(menu_pizza$menu) + length(menu_drinks$menu))) {
        cat("Invalid input. Please enter valid menu item numbers.\n")
      } else {
        total_price <- calculate_total(order_indices)
        cat("\nYou have ordered:\n")
        for (index in order_indices) {
          if (index <= length(menu_pizza$menu)) {
            cat(menu_pizza$menu[index], "\n")
          } else {
            cat(menu_drinks$menu[index - length(menu_pizza$menu)], "\n")
          }
        }
        cat("Total Price: $", total_price, "\n")
      }
    } else if (tolower(user_input) == "exit") {
      cat("Thank you for visiting our Pizza Restaurant!\n")
      break
    } else {
      cat("Invalid input. Please type 'menu' to select a menu or 'exit' to quit.\n")
    }
  }
}

# Example interaction with the bot
pizza_chatbot()
