library(tidyverse)
library(clusterProfiler)

# ORA

search_kegg_organism('mouse', by = 'common_name')

shrink.d11 <- readRDS("RObjects/Shrunk_Results.d11.rds")

sigGenes <- shrink.d11 %>%
  drop_na(Entrez, FDR) %>%
  filter(FDR < 0.05 & abs(logFC) > 1) %>%
  pull(Entrez)

keggRes <- enrichKEGG(gene = sigGenes, organism = 'mmu')
as_tibble(keggRes)

browseKEGG(keggRes, 'mmu04612')

library(pathview)

logFC <- shrink.d11$logFC
names(logFC) <- shrink.d11$Entrez

pathview(gene.data = logFC,
         pathway.id = "mmu04612",
         species = "mmu",
         limit = list(gene = 20, cpd = 1))


# Exercise 1

logFC <- shrink.d11 %>%
  drop_na(FDR, Entrez) %>%
  filter(FDR < 0.01) %>%
  pull(logFC,Entrez)

pathview(gene.data = logFC,
         pathway.id = "mmu04659",
         species = "mmu",
         limit = list(gene = 5, cpd = 1))

# Exercise 2

library(org.Mm.eg.db)

sigGenes <- shrink.d11 %>%
  drop_na(FDR) %>%
  filter(FDR < 0.01 & abs(logFC) > 1) %>%
  pull(GeneID)

universe <- shrink.d11$GeneID

ego <- enrichGO(gene = sigGenes,
                universe = universe,
                OrgDb = org.Mm.eg.db,
                keyType = "ENSEMBL",
                ont = "BP",
                pvalueCutoff = 0.01,
                readable = TRUE)
dotplot(ego, font.size = 14)

# GSEA

library(msigdbr)

rankedGenes <- shrink.d11 %>%
  drop_na(Entrez) %>%
  mutate(rank = logFC) %>%
  arrange(desc(rank)) %>%
  pull(rank,Entrez)

term2gene <- msigdbr(species = "Mus musculus", category = "H") %>%
  dplyr::select(gs_name, entrez_gene)
term2name <- msigdbr(species = "Mus musculus", category = "H") %>%
  dplyr::select(gs_name, gs_description) %>%
  distinct()

gseaRes <- GSEA(rankedGenes,
                TERM2GENE = term2gene,
                TERM2NAME = term2name,
                pvalueCutoff = 1,
                minGSSize = 15,
                maxGSSize = 500)

tab <- as_tibble(gseaRes) %>%
  arrange(desc(abs(NES))) %>%
  top_n(10, wt=-p.adjust) %>%
  dplyr::select(-core_enrichment) %>%
  mutate(across(c("enrichmentScore", "NES"), round, digit = 3)) %>%
  mutate(across(c("pvalue", "p.adjust", "qvalues"), scales::scientific))

gseaplot(gseaRes,
         geneSetID = "HALLMARK_INFLAMMATORY_RESPONSE",
         title = "HALLMARK_INFLAMMATORY_RESPONSE")

tab$leading_edge[1]

# Exercise 3

rankedGenes.e11 <- shrink.d11 %>%
  drop_na(Entrez,pvalue,logFC) %>%
  mutate(rank = -log10(pvalue) * sign(logFC)) %>%
  arrange(desc(rank)) %>%
  pull(rank,Entrez)

gseaRes.e11 <- GSEA(rankedGenes.e11,
                    TERM2GENE = term2gene,
                    TERM2NAME = term2name,
                    pvalueCutoff = 1,
                    minGSSize = 15,
                    maxGSSize = 500)
as_tibble(gseaRes.e11) %>%
  arrange(desc(abs(NES))) %>% 
  top_n(10, wt=-p.adjust) %>% 
  dplyr::select(-core_enrichment) %>%
  mutate(across(c("enrichmentScore", "NES"), round, digits=3)) %>% 
  mutate(across(c("pvalue", "p.adjust", "qvalues"), scales::scientific))

gseaplot(gseaRes.e11,
         geneSetID = "HALLMARK_INTERFERON_ALPHA_RESPONSE",
         title = "HALLMARK_INTERFERON_ALPHA_RESPONSE")
