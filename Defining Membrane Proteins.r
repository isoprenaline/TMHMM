my_data <- read.delim("c:/Users/jufei/Documents/Results of TMHMM.txt", header = F, row.names = 1)
results <- grep("PredHel=0", my_data$V5)
data <- my_data[-results,]
write.csv(data,file="C:/Users/jufei/Documents/Datas/Membrane proteins.csv",quote=F)
proteinID <- row.names(data)
geneID <- getBM(attributes = c("ensembl_gene_id", "external_gene_name","description"),
                filters = "ensembl_peptide_id", values = proteinID,
                mart = mart)
write.csv(geneID,file="C:/Users/jufei/Documents/Datas/Membrane geneID.csv",quote=F)
