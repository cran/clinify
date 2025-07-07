## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(clinify)
clintable(mtcars) |>
  clin_auto_page("gear")

## ----eval=FALSE---------------------------------------------------------------
# clintable(mtcars) |>
#   clin_auto_page("gear", when = 'notempty', drop = TRUE)

## ----setup--------------------------------------------------------------------
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

clintable(dat2) |>
  clin_page_by("page")

## -----------------------------------------------------------------------------
clintable(dat2) |>
  clin_page_by(max_rows = 5)

## -----------------------------------------------------------------------------
clintable(dat2) |>
  clin_page_by("page") |>
  clin_group_by(c("groups1", "groups2"), caption_by = "captions")

## -----------------------------------------------------------------------------
clintable(dat2) |>
  clin_page_by("page") |>
  clin_alt_pages(
    key_cols = c("mpg", "cyl", "hp"),
    col_groups = list(
      c("disp", "drat", "wt"),
      c("qsec", "vs", "am"),
      c("gear", "carb")
    )
  )

## -----------------------------------------------------------------------------
library(dplyr)
head(ToothGrowth, 20) |>
  mutate(page = make_grouped_pagenums(dose, 7))

