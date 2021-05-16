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

Here is a quick example of how this tool can be used for file paths:

```{r example}
library(safeSave)

# Example 1: Check whether there is a file called "data.rds" with the specified
# file path. If the file already exists, add a prefix to get a file name that 
# does not yet exist.
fp <- file.path("path", "to", "file", "data.rds")
file_path <- find_safe_path(fp)
```

And here is an example for its use with a directory:

```{r example}
library(safeSave)

# Example 2: Create a new directory, first ensuring that it does not already exist
dp <- file.path("path", "to", "directory")
dir_path <- find_safe_path(dp, is_dir=TRUE, create=TRUE)
```
