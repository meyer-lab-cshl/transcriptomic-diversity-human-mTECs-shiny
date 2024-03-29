#.libPaths("/opt/R/4.2.1/lib/R/library")

library(dplyr)
library(tidyverse)
all_tsr <- read_csv("data/All_TSR_mTECs.csv")

hi <- all_tsr %>%
    dplyr::select(Chr, Start, Stop, contains("hi_TPM"))
hi$sum_TPM <- rowSums(dplyr::select(hi, contains("hi_TPM")))

lo <- all_tsr %>%
  dplyr::select(Chr, Start, Stop, contains("lo_TPM"))
lo$sum_TPM <- rowSums(dplyr::select(lo, contains("lo_TPM")))

write_delim(dplyr::select(hi, Chr, Start, Stop, sum_TPM),
          "epitope_diversity/data/tsr_tpm_hi_sum.bedGraph",
          col_names = FALSE,
          delim="\t")

write_delim(dplyr::select(lo, Chr, Start, Stop, sum_TPM),
          "epitope_diversity/data/tsr_tpm_lo_sum.bedGraph",
          col_names = FALSE,
          delim="\t")
