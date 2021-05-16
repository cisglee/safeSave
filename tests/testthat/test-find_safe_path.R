# Initialize path to use for tests
path_to_self <- file.path(
  here::here(),
  'tests',
  'testthat',
  'test-find_safe_path.R'
)

#### Run test for file paths
testthat::test_that("Test whether the find_safe_path is able to find a unique file path to this test file", {
  safe_path_to_self <- find_safe_path(
    path_to_self,
    is_dir=FALSE,
    create_folder=FALSE
  )
  file_name_wo_ext <- tools::file_path_sans_ext(basename(safe_path_to_self))
  testthat::expect_identical(file_name_wo_ext, "test-find_safe_path (1)")
})

#### Run test for directory paths
testthat::test_that("Test whether the find_safe_path is able to find a unique folder name", {
  path_to_dir <- dirname(path_to_self)
  safe_path_to_self <- find_safe_path(
    path_to_dir,
    is_dir=TRUE,
    create_folder=FALSE
  )
  dir_name_wo_ext <- tools::file_path_sans_ext(basename(safe_path_to_self))
  testthat::expect_identical(dir_name_wo_ext, "testthat (1)")
})

#### Run tests for creating folder
testthat::test_that("Test whether the utility safe_save is able to create a folder in the project directory", {
  path_to_test_dir <- file.path(here::here(), '.testfolder')
  safe_path_to_folder <- find_safe_path(
    path_to_test_dir,
    is_dir=TRUE,
    create_folder=FALSE
  )
  testthat::expect_false(dir.exists(safe_path_to_folder))
  safe_path_to_folder_created <- find_safe_path(
    path_to_test_dir,
    is_dir=TRUE,
    create_folder=TRUE
  )
  testthat::expect_true(dir.exists(safe_path_to_folder_created))
  testthat::expect_identical(safe_path_to_folder, safe_path_to_folder_created)
  unlink(safe_path_to_folder_created)
})
