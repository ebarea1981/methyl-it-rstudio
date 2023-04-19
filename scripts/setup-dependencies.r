if (!requireNamespace("BiocManager")) install.packages("BiocManager")
BiocManager::install(ask=FALSE)

BiocManager::install(c('caret', 'Epi', 'e1071', 'minpack.lm', 'nls2',
    'caTools', 'RCurl', 'GenomicRanges', 'BiocParallel', 'biovizBase',
    'genefilter', 'data.table', 'dplyr', 'GenomeInfoDb', 'remotes')
    , dependencies=TRUE, ask=FALSE)

