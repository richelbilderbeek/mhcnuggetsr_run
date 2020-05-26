library(mhcnuggetsr)
library(testthat)
library(knitr)

expect_true(is_mhcnuggets_installed())

peptides_path <- get_example_filename("test_peptides.peps")
expect_true(file.exists(peptides_path))

mhc_1_haplotype <- "HLA-A02:01"
expect_true(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())

df <- epitope_predict(
  mhc_class = "I",
  peptides_path = peptides_path,
  mhc = mhc_1_haplotype
)

kable(df)

