## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, eval=FALSE--------------------------------------------------------
# library(clinify)
# 
# ct <- clintable(mtcars)
# write_clindoc(ct, file = tempfile(fileext = ".docx"))

## ----eval=FALSE---------------------------------------------------------------
# library(clinify)
# 
# ct <- clintable(mtcars)
# 
# doc <- clindoc(ct)
# 
# write_clindoc(doc, file = tempfile(fileext = ".docx"))

## ----eval=FALSE---------------------------------------------------------------
# ct1 <- clintable(head(mtcars, 10))
# ct2 <- clintable(head(iris, 10))
# 
# doc <- clindoc(ct1, ct2)
# 
# write_clindoc(doc, file = tempfile(fileext = ".docx"))

## ----eval=FALSE---------------------------------------------------------------
# ct1 <- clintable(head(mtcars, 10))
# ct2 <- clintable(head(iris, 10))
# 
# doc <- clindoc(list(ct1, ct2))
# 
# write_clindoc(doc, file = tempfile(fileext = ".docx"))

## ----eval=FALSE---------------------------------------------------------------
# tables <- lapply(list(mtcars, iris), \(x) clintable(head(x, 10)))
# 
# doc <- clindoc(tables) |>
#   clin_add_titles(
#     list(
#       c("Left", "Page {PAGE} of {NUMPAGES}"),
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
#   )
# 
# write_clindoc(doc, file = tempfile(fileext = ".docx"))

