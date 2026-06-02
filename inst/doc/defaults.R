## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
# clinify_docx_default <- function() {
#   # I want these as defaults but need to carry it forward because
#   # the default section strips it off
#   margins <- as.list(
#     append(officer::docx_dim(officer::read_docx())$margins, list(gutter = 0))
#   )
# 
#   officer::prop_section(
#     page_size = officer::page_size(orient = "landscape"),
#     type = "continuous",
#     page_margins = do.call(officer::page_mar, margins)
#   )
# }

## ----eval=FALSE---------------------------------------------------------------
# clinify_titles_default <- function(x, ...) {
#   # Remove all borders as heading does not need any.
#   x <- flextable::border_remove(x)
#   # Setup font properties.
#   x <- flextable::color(x, color = "black")
#   x <- flextable::fontsize(x, size = 9)
#   x <- flextable::font(x, font = "Courier New")
#   x <- flextable::bold(x, bold = FALSE)
#   x <- flextable::italic(x, italic = FALSE)
# 
#   # Default table width
#   x <- flextable::width(x, width = clin_default_table_width() / 2)
#   # Setup the interval between rows.
#   x <- flextable::line_spacing(x, space = 1, part = "all")
#   # Setup the cell padding.
#   x <- flextable::padding(x, part = "all", padding.bottom = 0, padding.top = 0)
#   x <- flextable::set_table_properties(
#     x,
#     layout = "fixed"
#   )
#   # Automatically find and update a pagenum string
#   x <- clin_replace_pagenums(x)
#   x
# }
# 
# clinify_footnotes_default <- function(x, ...) {
#   # Remove all borders.
#   x <- flextable::border_remove(x)
#   # Page footer should have single top border over the top row.
#   x <- flextable::hline_top(
#     x,
#     part = "body",
#     border = officer::fp_border(color = "black", width = 1)
#   )
#   # Setup font properties.
#   x <- flextable::color(x, color = "black")
#   x <- flextable::fontsize(x, size = 9)
#   x <- flextable::font(x, font = "Courier New")
#   x <- flextable::bold(x, bold = FALSE)
#   x <- flextable::italic(x, italic = FALSE)
#   # One has to specify the width of the page header "table", which in this case
#   # is landscape page width minus two times 1 in margin.
#   x <- flextable::width(x, width = clin_default_table_width() / 2)
#   # Setup the interval between rows.
#   x <- flextable::line_spacing(x, space = 1, part = "all")
#   # Setup the cell padding.
#   x <- flextable::padding(x, part = "all", padding.bottom = 0, padding.top = 0)
# 
#   x <- flextable::set_table_properties(
#     x,
#     layout = "fixed"
#   )
#   # Automatically find and update a pagenum string
#   x <- clin_replace_pagenums(x)
#   x
# }

## ----eval=FALSE---------------------------------------------------------------
# clinify_table_default <- function(x, ...) {
#   # Clear all borders first and apply them just for the header
#   # (as horizontal lines).
#   x <- flextable::border_remove(x)
#   x <- flextable::hline(
#     x,
#     part = "header",
#     border = officer::fp_border()
#   )
#   # Top horizontal line for the table header.
#   x <- flextable::hline_top(x, part = "header")
#   x <- flextable::hline(x, part = "header", border = officer::fp_border())
# 
#   # Remove blank bottoms
#   blk_inds <- which(
#     mapply(trimws, x$header$dataset) == "",
#     arr.ind = TRUE
#   )
#   # Want to ignore bottom row
#   blk_inds <- blk_inds[
#     blk_inds[, "row"] < nrow(x$header$dataset),
#     ,
#     drop = FALSE
#   ]
# 
#   if (nrow(blk_inds) > 0) {
#     # Loop all except very bottom row
#     for (i in 1:nrow(blk_inds)) {
#       x <- flextable::hline(
#         x,
#         i = blk_inds[i, "row"],
#         j = blk_inds[i, "col"],
#         part = "header",
#         border = officer::fp_border(style = "none", width = 0)
#       )
#     }
#   }
#   # Bottom border
#   x <- flextable::hline_bottom(x, part = "header")
# 
#   # Set font properties for the table header.
#   x <- flextable::font(x, part = "all", fontname = "Courier New")
# 
#   # Set fontsize for both table header and table body.
#   x <- flextable::fontsize(x, part = "all", size = 9)
# 
#   # Set table's layout.
#   x <- flextable::set_table_properties(
#     x,
#     layout = "fixed"
#   )
# 
#   x
# }

## ----eval=FALSE---------------------------------------------------------------
# clinify_grouplabel_default <- function(x, ...) {
#   # Remove topline above group label
#   x <- flextable::hline_top(
#     x,
#     part = "header",
#     border = officer::fp_border(style = "none", width = 0)
#   )
#   # Topline needs to shift down
#   x <- flextable::hline(
#     x,
#     i = 1,
#     part = "header",
#     border = officer::fp_border()
#   )
# }

## ----eval=FALSE---------------------------------------------------------------
# clinify_caption_default <- function(x, ...) {
#   # Set font properties for the table header.
#   x <- flextable::font(x, part = "footer", fontname = "Courier New")
#   # Set fontsize for both table header and table body.
#   x <- flextable::fontsize(x, part = "footer", size = 9)
# }

## ----eval=FALSE---------------------------------------------------------------
# options(
#   clinify_docx_default = sect,
#   clinify_titles_default = clinify_titles_default,
#   clinify_footnotes_default = clinify_footnotes_default,
#   clinify_table_default = clinify_table_default,
#   clinify_caption_default = clinify_caption_default,
#   clinify_grouplabel_default = clinify_grouplabel_default
# )

