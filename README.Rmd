
```{r, include = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)
```

# safeSave

<!-- badges: start -->
<!-- badges: end -->

Small R tool consisting of a single function that helps you find a file or 
folder name that does not already exist

The find_safe_path function checks whether the specified \code{path} exists.
If the file or folder does not exist, the specified path is returned to the
user. If the folder does not exist and \code{create_folder} is set to
\code{TRUE}, the folder (for a path to a folder) or parent folder (for a
path to a file) is created. If the specified \code{path} does exist a numeric
suffix will be added that does not already exist. The search for a suffix
starts with 1 and increases incrementally. It is placed in brackets and, if
applicable, comes before the file extension. Thus, the file path
\code{"/path/to/file.docx"} could become \code{"/path/to/file (1).docx"},
if the latter does not already exist.

## Installation

You can install the released version of safeSave from 
GitHub with:

``` r
install_github("cisglee/safeSave")
```

## Example

Here is a quick example of how this tool can be used:

```{r example}
library(safeSave)
dir_path <- find_safe_path(file.path("path", "to"), is_dir=TRUE, create=TRUE)  # Create a folder, first ensuring that it does not already exist
file_path <- find_safe_path(file.path("path", "to", "file", "data.rds"))  # Check whether there is a file "data.rds" in the specified folder and get a non-existent file name if it does already exist
```
