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
      c("Left", "Center", "Right"),
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
dat['page'] <- c(
  rep(1, 10),
  rep(2, 10),
  rep(3, 10),
  c(4, 4)
)
dat2 <- rbind(dat, dat)
dat2['groups1'] <- c(
  rep('a', 32),
  rep('b', 32)
)
dat2['groups2'] <- c(
  rep('1', 16),
  rep('2', 16),
  rep('1', 16),
  rep('2', 16)
)

# Create a basic table
ct <- clintable(dat2) |> 
  clin_page_by('page') |> 
  clin_group_by(c('groups1', 'groups2')) |> 
  clin_alt_pages(
    key_cols = c('mpg', 'cyl', 'hp'),
    col_groups = list(
      c('disp', 'drat', 'wt'),
      c('qsec', 'vs', 'am'),
      c('gear', 'carb')
    ) 
  ) |> 
  clin_col_widths(mpg = .2, cyl=.2, disp=.15, vs=.15) |>
  clin_add_titles(
    list(
      c("Left", "Center", "Right"),
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
#   [...] |>
#   clin_alt_pages(
#     key_cols = c('mpg', 'cyl', 'hp'),
#     col_groups = list(
#       c('disp', 'drat', 'wt'),
#       c('qsec', 'vs', 'am'),
#       c('gear', 'carb')
#     )
#   )

## ----eval=FALSE---------------------------------------------------------------
# [...] |>
#   clin_col_widths(mpg = .2, cyl=.2, disp=.15, vs=.15) |>
# [...]

## -----------------------------------------------------------------------------
  clintable(iris) |> 
    clin_column_headers(
      Sepal.Length = c("Flowers", "Sepal", "Length"),  
      Sepal.Width = c("Flowers", "Sepal", "Width"),  
      Petal.Length = c("Petal", "Length"),  
      Petal.Width = c("Petal", "Width")
    )

## ----eval=FALSE---------------------------------------------------------------
# [...]
#       Sepal.Length = c("Flowers", "Sepal", "Length"),
#       Sepal.Width = c("Flowers", "Sepal", "Width"),
# [...]

## -----------------------------------------------------------------------------
  iris2 <- iris
  attr(iris2$Sepal.Length, 'label') <- "Flower||Sepal||Length"
  attr(iris2$Sepal.Width, 'label') <- "Flower||Sepal||Width"
  attr(iris2$Petal.Length, 'label') <- "Flower||Petal||Length"
  attr(iris2$Petal.Width, 'label') <- "Flower||Petal||Width"

  clintable(iris2) |> 
    align(align='center', part='header') |>
    align(align='center', part='body')

## ----write_clintable, eval=FALSE----------------------------------------------
# # Create a basic table
# ct <- clintable(dat2) |>
#   clin_page_by(max_rows = 36) |>
#   clin_group_by(c('groups1', 'groups2')) |>
#   clin_alt_pages(
#     key_cols = c('mpg', 'cyl', 'hp'),
#     col_groups = list(
#       c('disp', 'drat', 'wt'),
#       c('qsec', 'vs', 'am'),
#       c('gear', 'carb')
#     )
#   ) |>
#   clin_col_widths(mpg = .2, cyl=.2, disp=.15, vs=.15) |>
#   clin_add_titles(
#     list(
#       c("Left", "Center", "Right"),
#       c("Just the middle")
#     )
#   ) |>
#   clin_add_footnotes(
#       list(
#         c(
#           "Here's a footnote.",
#           format(Sys.time(), "%H:%M %A, %B %d, %Y")
#         )
#       )
#     )
# 
# write_clintable(ct, file="example_table.docx")

