# description -------------------------------------------------------------

# a script to access the latest World Bank income groups data and store a tidy
# version as a CSV file

url = "https://datacatalogfiles.worldbank.org/ddh-published/0037712/DR0090755/CLASS.xlsx"

download.file(url = url,
              destfile = "data/wb-income-groups.xlsx")

income_groups_levels <-  c("High income",
                           "Upper middle income",
                           "Lower middle income",
                           "Low income")


readxl::read_excel("data/wb-income-groups.xlsx", n_max = 219) |>
  select(iso3 = Code, income_group = `Income group`) |>
  mutate(income_group = factor(income_group, level = income_groups_levels)) |>
  write_rds("data/wb-income-groups.rds")
