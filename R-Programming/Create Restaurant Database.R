# load library
library(RSQLite)

# Create Database Connection
restaurant <- dbConnect(SQLite(), "restaurant.db")

# Create Table
dbWriteTable(restaurant, 
             "customers", 
             data.frame(customer_id = 1:20,
                        customer_name = sample(c("Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Harry", "Ivy", "Jack"), 20, replace = TRUE),
                        order_date = sample(seq(as.Date('2023/01/01'), as.Date('2023/12/31'), by="day"), 20),
                        menu_item = sample(c("Pad Thai", "Tom Yum Soup", "Mango Sticky Rice"), 20, replace = TRUE),
                        quantity = sample(1:5, 20, replace = TRUE),
                        total_price = c(160, 50, 100, 320, 160, 80, 360, 400, 240, 240, 240, 600, 80, 200, 150, 360,240, 150, 100, 480)
                        )
             )

dbWriteTable(restaurant, 
             "menus", 
             data.frame(menu_id = 1:3,
                    menu_name = c("Pad Thai", "Tom Yum Soup", "Mango Sticky Rice"),
                    price = c(120, 80, 50)
                        )
             )

# Get Data
dbListTables(restaurant)
dbListFields(restaurant, "customers")
dbListFields(restaurant, "menus")

df_customers <- dbGetQuery(restaurant, "select * from customers")
View(df_customers)
df_menus <- dbGetQuery(restaurant, "select * from menus")
View(df_menus)

# Close Connection
dbDisconnect(restaurant)
