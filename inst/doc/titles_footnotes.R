## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(clinify)

clintable(mtcars) |>
  clin_add_titles(
    list(
      c("Left", "Page {PAGE} of {NUMPAGES}"),
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

## -----------------------------------------------------------------------------
clintable(mtcars) |>
  clin_add_titles(ft = flextable::flextable(head(iris, 2)))

## -----------------------------------------------------------------------------
spec <- data.frame(
  type = c("title", "title", "footnote", "footnote_page"),
  text1 = c(
    "Protocol: CDISCPILOT01",
    "Table 14-2.01",
    "Source: {FILE}",
    "Kept off the table pages"
  ),
  text2 = c("Page {PAGE} of {NUMPAGES}", NA, NA, NA),
  align = c("split", "center", "left", "left")
)

clintable(head(iris, 3)) |>
  clin_add_titles(spec, tokens = list(FILE = "programs/t14-2-01.R")) |>
  clin_add_footnotes(spec, tokens = list(FILE = "programs/t14-2-01.R")) |>
  clin_add_footnote_page(spec)

## -----------------------------------------------------------------------------
clintable(mtcars) |>
  clin_add_titles(
    list(
      c("Left", "Left"),
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
  ) |>
  clin_add_footnote_page(
    list(
      c("One very long footnote full of text"),
      c("Two very long footnote full of text"),
      c("Three very long footnote full of text"),
      c("Four very long footnote full of text"),
      c("Five very long footnote full of text")
    )
  )

