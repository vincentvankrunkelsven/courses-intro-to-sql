library(readr)
library(dplyr)
set.seed(834)

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
customers$age[4] <- NA

# product_sales: sale_id, product_id
product_sales <- data_frame(
  sale_id = rep(1:10, c(2, 1, 4, 1, 1, 3, 2, 5, 2, 1)),
  product_id = sample(products$id, length(sale_id), replace = TRUE)
) %>%
  arrange(sale_id, product_id)

# sales: id, date, amount, customer_id, payment_type, amount
sales <- data_frame(
  id = 1:10,
  date = c("5/22/16", "6/12/16", "6/12/16", "7/25/16", "8/1/16",
           "8/4/16", "8/8/16", "8/16/16", "9/6/16", "9/20/16"),
  customer_id = sample(customers$id, 10, replace = TRUE),
  payment_type = sample(c("Cash", "Credit"), 10, replace = TRUE, prob = c(.4, .6))
)

# temp table, to be removed
amounts_paid <- product_sales %>%
  inner_join(products, by = c("product_id" = "id")) %>%
  group_by(sale_id) %>%
  summarize(n_products = n(),
            amount = round(sum(price), 2)
  )

# add amount column to sales
sales <- sales %>%
  inner_join(amounts_paid, by = c("id" = "sale_id"))

# save to csv
path <- "data/raw/"
write_csv(customers, file.path(path, "customers.csv"))
write_csv(products, file.path(path, "products.csv"))
write_csv(sales, file.path(path, "sales.csv"))
write_csv(product_sales, file.path(path, "product_sales.csv"))

# remove cruft
rm(amounts_paid)
rm(path)

# print all tables
sapply(ls(), function(x) as.data.frame(get(x)))
