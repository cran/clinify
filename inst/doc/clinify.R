## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo=FALSE, results = 'hide'--------------------------------------
suppressPackageStartupMessages(library(clinify))

## ----intro--------------------------------------------------------------------
library(clinify)
library(flextable)
library(officer)

ct <- clintable(mtcars)
print(ct)

## ----titles_and_footnotes-----------------------------------------------------
ct <- clintable(mtcars) |>
  clin_add_titles(
    list(
      c("Left", "Right"),
      c("Just the middle")
    )
  ) |>
  clin_add_footnotes(
    list(
      c(
        "Here's a footnote.",
        format(Sys.time(), "%H:%M %A, %B %d, %Y")
      )
    )
  )

print(ct)

## ----extras-------------------------------------------------------------------
dat <- mtcars
dat["page"] <- c(
  rep(1, 10),
  rep(2, 10),
  rep(3, 10),
  c(4, 4)
)
dat2 <- rbind(dat, dat)
dat2["groups1"] <- c(
  rep("a", 32),
  rep("b", 32)
)
dat2["groups2"] <- c(
  rep("1", 16),
  rep("2", 16),
  rep("1", 16),
  rep("2", 16)
)

dat2["captions"] <- c(
  rep("Caption 1", 16),
  rep("Caption 2", 16),
  rep("Caption 3", 16),
  rep("Caption 4", 16)
)

# Create a basic table
ct <- clintable(dat2) |>
  clin_page_by("page") |>
  clin_group_by(c("groups1", "groups2")) |>
  clin_alt_pages(
    key_cols = c("mpg", "cyl", "hp"),
    col_groups = list(
      c("disp", "drat", "wt"),
      c("qsec", "vs", "am"),
      c("gear", "carb")
    )
  ) |>
  clin_col_widths(mpg = .2, cyl = .2, disp = .15, vs = .15) |>
  clin_add_titles(
    list(
      c("Left", "Right"),
      c("Just the middle")
    )
  ) |>
  clin_add_footnotes(
    list(
      c(
        "Here's a footnote.",
        format(Sys.time(), "%H:%M %A, %B %d, %Y")
      )
    )
  )

print(ct)

## ----eval=FALSE---------------------------------------------------------------
# ct |>
#   clin_alt_pages(
#     key_cols = c("mpg", "cyl", "hp"),
#     col_groups = list(
#       c("disp", "drat", "wt"),
#       c("qsec", "vs", "am"),
#       c("gear", "carb")
#     )
#   )

## ----eval=FALSE---------------------------------------------------------------
# ct |>
#   clin_col_widths(mpg = .2, cyl = .2, disp = .15, vs = .15)

## -----------------------------------------------------------------------------
clintable(iris) |>
  clin_column_headers(
    Sepal.Length = c("Flowers", "Sepal", "Length"),
    Sepal.Width = c("Flowers", "Sepal", "Width"),
    Petal.Length = c("Petal", "Length"),
    Petal.Width = c("Petal", "Width")
  )

## -----------------------------------------------------------------------------
iris2 <- iris
attr(iris2$Sepal.Length, "label") <- "Flower||Sepal||Length"
attr(iris2$Sepal.Width, "label") <- "Flower||Sepal||Width"
attr(iris2$Petal.Length, "label") <- "Flower||Petal||Length"
attr(iris2$Petal.Width, "label") <- "Flower||Petal||Width"

clintable(iris2) |>
  align(align = "center", part = "header") |>
  align(align = "center", part = "body")

## ----write_clindoc, eval=FALSE------------------------------------------------
# # Create a basic table
# ct <- clintable(dat2) |>
#   clin_page_by("page") |>
#   clin_group_by(c("groups1", "groups2"), caption_by = "captions") |>
#   clin_alt_pages(
#     key_cols = c("mpg", "cyl", "hp"),
#     col_groups = list(
#       c("disp", "drat", "wt"),
#       c("qsec", "vs", "am"),
#       c("gear", "carb")
#     )
#   ) |>
#   clin_column_headers(
#     mpg = "Miles/(US) gallon",
#     cyl = c("Number of cylinders"),
#     disp = c("Displacement\n(cu.in.)"),
#     hp = c("Gross horsepower"),
#     drat = c("Span multiple pages", "Rear axle ratio"),
#     wt = c("Span multiple pages", "Weight (1000 lbs)"),
#     qsec = c("Span multiple pages", "1/4 mile time"),
#     vs = c("Span multiple pages", "Engine\n(0 = V-shaped, 1 = straight)"),
#     am = c("Span multiple pages", "Transmission\n(0 = automatic, 1 = manual)"),
#     gear = c("Some Spanner", "Number of forward gears"),
#     carb = c("Some Spanner", "Number of carburetors")
#   ) |>
#   clin_col_widths(mpg = .2, cyl = .2, disp = .15, vs = .15) |>
#   clin_add_titles(
#     list(
#       c("Left", "Right"),
#       c("Just the middle")
#     )
#   ) |>
#   clin_add_footnotes(
#     list(
#       c(
#         "Here's a footnote.",
#         format(Sys.time(), "%H:%M %A, %B %d, %Y")
#       )
#     )
#   ) |>
#   clin_add_footnote_page(
#     list(
#       c("One very long footnote full of text"),
#       c("Two very long footnote full of text"),
#       c("Three very long footnote full of text"),
#       c("Four very long footnote full of text"),
#       c("Five very long footnote full of text")
#     )
#   )
# 
# # Catch the officer::rdocx object itself
# doc <- clindoc(ct)
# 
# # Write the clindoc
# write_clindoc(doc, file = "example_table.docx")
# 
# # Alternately just write the clintable directly
# write_clindoc(ct, file = "example_table.docx")

