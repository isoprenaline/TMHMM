library(biomaRt)
require(reshape2)
EnsemblGeneID <- read.csv('C:/Users/jufei/Documents/EnsemblGeneID.csv', header=F, stringsAsFactors = FALSE)
# define biomart object
mart <- useMart(biomart = "ensembl", dataset = "mmusculus_gene_ensembl")
# query biomart
results <- apply(EnsemblGeneID, 1, function(x){
              getBM(attributes = "ensembl_peptide_id",
                filters = "ensembl_gene_id", values = x,
                mart = mart)})
results <- melt(results)
results <- results[,1]
protein <- getSequence(id= results,
                       type="ensembl_peptide_id",
                       seqType="peptide", 
                       mart= mart)
exportFASTA(protein, file = "C:/Users/jufei/Documents/Datas/AA sequecnes.fa")
