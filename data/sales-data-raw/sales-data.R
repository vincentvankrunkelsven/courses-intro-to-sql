library(readr)
library(dplyr)
set.seed(8234)

# products: id, name, price, mfr
products <- data_frame(
  id = 1:6,
  name = c("Flashlight", "Tent", "Stove", "Sleeping bag", "Water bottle", "Skillet"),
  price = c(9.99, 97, 34.95, 75, 9.99, 10.59),
  mfr = c("The Great Outdoors", "Pyramid Co.", "Kitchen Supplies, Inc.",
          "The Great Outdoors", "CGM INCORPORATED", "The Great Outdoors")
)

# customers: id, first_name, last_name, age, state
customers <- data_frame(
  id = 1:7,
  name = c("Lore", "Tom", "Hugo", "Yashas", "Nicole", "Richie", "Sumedh"),
  age = sample(21:70, 7),
  state = c("MA", "NY", "NY", "MD", "AZ", "CA", "NY")
)
customers$age[c(1, 4)] <- NA

# sales: id, date, amount, customer_id, payment_type, amount
sales <- data_frame(
  id = 1:10,
  date = c("5/22/16", "6/12/16", "6/12/16", "7/25/16", "8/1/16",
           "8/4/16", "8/8/16", "8/16/16", "9/6/16", "9/20/16"),
  customer_id = sample(customers$id, 10, replace = TRUE),
  product_id = sample(products$id, 10, replace = TRUE),
  payment_type = sample(c("Cash", "Credit"), 10, replace = TRUE, prob = c(.4, .6))
)

# save to csv
path <- "data/raw/"
write_csv(customers, file.path(path, "customers.csv"))
write_csv(products, file.path(path, "products.csv"))
write_csv(sales, file.path(path, "sales.csv"))

# remove cruft
rm(path)

# print all tables
sapply(ls(), function(x) as.data.frame(get(x)))
