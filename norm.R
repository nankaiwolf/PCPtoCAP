# 谁说我写代码不写注释的？
# 这段代码是对已经进行物种注释的下机数据归一化，便于后续进行物种构成的分析。
# Kraken2只能直接对序列进行注释，而不会归一化。
# HUMAnN3处理的通路已经自动归一化，不需要额外处理。

# 读入MPA格式（MetaPhlAn）的物种注释表格，已经标记好组别。
taxo <- read.table("cap-pcp.mpa", sep = "\t", header = T, 
                   row.names = 1)

# 这是设置每个样本的reads数量，便于进行归一化。
reads.num <- c(33434083, 35969038, 16349582, 17546035, 36008954, 12034498,
               13803551, 18542030, 27698332, 32919830, 14494168, 20073376)

# 这就是归一化的过程，每千万序列中注释出的物种数量。
normalized <- taxo
for (i in 1:12) {
  normalized[i] <- taxo[i] / reads.num[i] * 1000000
}

# 将归一化数据写入文件。
write.table(normalized, file = "norm.tsv", sep = '\t', quote = F,
            row.names = T, col.names = T)

# 从归一化数据中提取出细菌和古菌，合并成为供分析的菌群微生态。
bact <- normalized[grep("k__Bacteria", rownames(normalized)), ]
arch <- normalized[grep('k__Archaea', rownames(normalized)), ]
microbiome <- rbind(bact, arch)

# 将归一化的微生态数据写入文件，供后续分析。
write.table(microbiome, file = "microbiome.tsv", sep = '\t', quote = F,
            row.names = T, col.names = T)
