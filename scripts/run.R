library(mhcnuggetsr)
library(testthat)
library(knitr)

expect_true(is_mhcnuggets_installed())

peptides_path <- "my_peptides.txt"
expect_true(file.exists(peptides_path))

mhc_1_haplotype <- "HLA-A02:01"
expect_true(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())

mhcnuggets_options <- create_mhcnuggets_options(
  mhc_class = "I",
  mhc = mhc_1_haplotype
)

df <- predict_ic50_from_file(
  peptides_path = peptides_path,
  mhcnuggets_options = mhcnuggets_options
)

kable(df)

