library(DESeq2)
library(tidyverse)
# load data
txi <- readRDS('RObjects/txi.rds')
sampleinfo <- read_tsv('data/samplesheet_corrected.tsv', col_types = 'cccc') %>% 
  mutate( Status = fct_relevel(Status, 'Uninfected')) %>% 
  mutate( TimePoint = fct_relevel( TimePoint, 'd11'))
sampleinfo$Status
simple.model <- as.formula(~ Status)
# create Deseq Data Set
ddsObj.raw <- DESeqDataSetFromTximport(txi=txi, colData = sampleinfo, design = simple.model)
ddsObj.raw
# filter data
keep <- rowSums( counts(ddsObj.raw) ) > 5 
ddsObj.filt <- ddsObj.raw[keep, ]

dim(ddsObj.raw)
dim(ddsObj.filt)

ddsObj <- DESeq( ddsObj.filt)

results.simple <- results( ddsObj, alpha = 0.05)
sum(results.simple$padj < 0.05, na.rm=T)

# Exercise 2: apply additive model

additive.model <- as.formula( ~ TimePoint + Status)

is.factor(sampleinfo$Status)

is.factor(sampleinfo$TimePoint)
as.factor(sampleinfo$TimePoint)

ddsObj.raw <- DESeqDataSetFromTximport(txi=txi, colData = sampleinfo, design = additive.model)

ddsObj.filt <- ddsObj.raw[keep,]
dim(ddsObj.filt)
design(ddsObj.filt)
ddsObj <- DESeq(ddsObj.filt)
results(ddsObj)
results.additive <- results(ddsObj, alpha=0.05)
resultsNames(ddsObj)
model.matrix(additive.model, data=sampleinfo)
results.additive

# 2b
sum(results.additive$padj < 0.05, na.rm = T)  # 2766
sum(results.simple$padj < 0.05, na.rm=T) # 2884

# Exercise 3
resultsNames(ddsObj)

results.d33vd11 <- results(ddsObj, name='TimePoint_d33_vs_d11', alpha = 0.05)
# 3.2
sum( results.d33vd11$padj < 0.05, na.rm = T)

##############################################################################################################################
# Additive model or interaction model?

# PCA
vstcounts <- vst(ddsObj.raw, blind = TRUE)

plotPCA(vstcounts, intgroup = c( 'Status', 'TimePoint'))


# Comparing two design models

ddsObj.LRT <- DESeq( ddsObj, test='LRT', reduced = simple.model )

design(ddsObj)

results_Additive_v_Simple <- results(ddsObj.LRT)
results_Additive_v_Simple

sum( results_Additive_v_Simple$padj < 0.05, na.rm = T)

# Exercise 4
interaction.model <- as.formula( ~ TimePoint*Status)

interaction.model <- as.formula( ~ TimePoint + Status + TimePOint:Status)

ddsObj.raw <- DESeqDataSetFromTximport(txi=txi, colData = sampleinfo, design = interaction.model)
ddsObj.filt <- ddsObj.raw[keep,]

ddsObj.interaction <- DESeq( ddsObj.filt)

ddsObj.LRT <- DESeq( ddsObj.interaction, test='LRT', reduced = additive.model)

results.Interaction_v_Additive <- results(ddsObj.LRT)

sum(results.Interaction_v_Additive$padj < 0.05, na.rm=T)

results_Additive_v_Simple %>% 
  as.data.frame() %>% 
  filter( padj < 0.05 & !is.na(padj)) 


# Extract specific contrasts from interaction model

resultsNames(ddsObj.interaction)
results.interaction.11 <- results( ddsObj.interaction, alpha = 0.05, name='Status_Infected_vs_Uninfected')

results.interaction.33 <- results( ddsObj.interaction, alpha = 0.05,
                                   contrast = list( c('Status_Infected_vs_Uninfected', 'TimePointd33.StatusInfected') )
                                   
                                   )

sum(results.interaction.11$padj < 0.05, na.rm=T)

sum(results.interaction.33$padj < 0.05, na.rm=T)

# Exercise 5
resultsNames(ddsObj.interaction)

results.d33_v_d11_uninfected <- results(ddsObj.interaction, alpha=0.05, name='TimePoint_d33_vs_d11')

sum(results.d33_v_d11_uninfected$padj < 0.05, na.rm=T)

resultsNames(ddsObj.interaction)


results.d33_v_d11_infected <- results(ddsObj.interaction, 
                                      contrast = list(c("TimePoint_d33_vs_d11", "TimePointd33.StatusInfected")),
                                      alpha = 0.05)

