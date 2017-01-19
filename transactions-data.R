library(readr)
library(dplyr)
set.seed(1234)

# products: id, name, price, mfr
products <- data_frame(
  id = 1:6,
  name = c("Flashlight", "Tent", "Stove", "Sleeping bag", "Water bottle", "Skillet"),
  price = c(14.95, 99, 34.99, 75, 9.99, 10.59),
  mfr = c("The Great Outdoors", "Pyramid Co.", "Kitchen Supplies, Inc.",
          "The Great Outdoors", "CGM", "The Great Outdoors")
)

# customers: id, first_name, last_name, age, state
customers <- data_frame(
  id = 1:7,
  name = c("Lore", "Tom", "Hugo", "Yashas", "Nicole", "Richie", "Sumedh"),
  age = sample(21:70, 7),
  state = c("MA", "NY", "NY", "MD", "AZ", "CA", "NY")
)

# products_transactions: transaction_id, product_id
products_transactions <- data_frame(
  transaction_id = rep(1:10, sample(nrow(products) - 2, 10, replace = TRUE)),
  product_id = sample(products$id, length(transaction_id), replace = TRUE)
) %>%
  arrange(transaction_id, product_id)

# transactions: id, date, amount, customer_id
transactions <- data_frame(
  id = 1:10,
  date = c("5/22/16", "6/12/16", "6/12/16", "7/25/16", "8/1/16",
           "8/4/16", "8/8/16", "8/16/16", "9/6/16", "9/20/16"),
  customer_id = sample(customers$id, 10, replace = TRUE),
  payment_type = sample(c("Cash", "Credit"), 10, replace = TRUE, prob = c(.3, .7))
)

# temp table, to be removed
amounts_paid <- products_transactions %>%
  inner_join(products, by = c("product_id" = "id")) %>%
  group_by(transaction_id) %>%
  summarize(n_products = n(),
            amount = sum(price)
  )

# add amount column to transactions
transactions <- transactions %>%
  inner_join(amounts_paid, by = c("id" = "transaction_id"))

# remove cruft
rm(amounts_paid)

# print all tables
# sapply(ls(), get)

# save to csv
path <- "data/raw/"
write_csv(customers, file.path(path, "customers.csv"))
write_csv(products, file.path(path, "products.csv"))
write_csv(transactions, file.path(path, "transactions.csv"))
write_csv(products_transactions, file.path(path, "products_transactions.csv"))
