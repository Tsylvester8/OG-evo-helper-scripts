#Read vcf file
temp_vcf <- read.table("Galaxy826-[VCFfilter__on_data_824].vcf", stringsAsFactors = FALSE)

#looking at the qual scores
#hist(temp_vcf$V6,
#     xlab = "QUAL",
#     main = "Galaxy VCF quality data for 4 samples")

#qual.vcf<- temp_vcf[temp_vcf$V6 >= 250,]

#Read single copy genes text file
test_genes <- read.csv("Candidate_single_copy_genes.csv", 
                 header = F,
                 as.is = T)
#filtering single copy genes based on the list
new.vcf <- temp_vcf[(temp_vcf$V1 %in% test_genes$V1),]

#re-write table
write.table(new.vcf,
            file = "Galaxy511_NS_30_genes.vcf",
            row.names = F,
            col.names = F,
            sep = "\t",
            quote = F)

