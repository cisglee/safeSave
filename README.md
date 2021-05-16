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

## Examples

Here are a few examples of how this tool can be used. 

### File Path
For a file path, the function \code{find_safe_path} checks whether there 
is a file called \code{data.rds} with the specified file path:

```{r example}
library(safeSave)
 
fp <- file.path("path", "to", "file", "data.rds")
file_path <- find_safe_path(fp)
```
If \code{data.rds} does not exist, the original file path is returned.
If it does exist, a prefix is added until a non-existent file name is 
found. The prefix starts at 1 and increments. For example, 
\code{data.rds} can become \code{data (1).rds}, \code{data (2).rds} 
etc.

If the folder in which the file is placed might still need to be 
created, this can be specified by setting the \code{create_folder} 
parameter to \code{TRUE}:
```{r example}
library(safeSave)
 
fp <- file.path("path", "to", "file", "data.rds")
file_path <- find_safe_path(fp, create_folder=TRUE)
```

### Directory Path
And here is an example for the use of the function with a directory:

```{r example}
library(safeSave)

dp <- file.path("path", "to", "directory")
dir_path <- find_safe_path(
    dp,
    is_dir=TRUE,
    create=TRUE,
    recursive=TRUE
)
```
Here \code{find_safe_path} checks whether the directory 
\code{directory} exists and, if it does not, it creates this directory.
Since recursive is set to \code{TRUE} any non-existent parent 
directories are created as well. If the directory does exist, a suffix
is added until a non-existent directory name is found. Naming is
similar to that of a file - i.e., \code{directory} can become 
\code{directory (1)} or \code{directory (2)} etc. 
