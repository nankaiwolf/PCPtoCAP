# 读入文件。
taxo.all <- read.table('microbiome.tsv', sep = '\t',
                       header = T, row.names = 1)

# 把精确到种的结果写入文件。
write.table(taxo.all, "micro.species.tsv", 
            row.names = T, col.names = T, 
            quote = F, sep = "\t")

# 删除种（species）的结果。
taxo.all <- taxo.all[grep("s__", row.names(taxo.all), invert = T), ]

# 把精确到属（genus）的结果写入文件。
write.table(taxo.all, "micro.genus.tsv", 
            row.names = T, col.names = T, 
            quote = F, sep = "\t")

# 删除属（genus）的结果。
taxo.all <- taxo.all[grep("g__", row.names(taxo.all), invert = T), ]

# 把精确到科（family）的结果写入文件。
write.table(taxo.all, "micro.family.tsv", 
            row.names = T, col.names = T, 
            quote = F, sep = "\t")

# 删除科（family）的结果。
taxo.all <- taxo.all[grep("f__", row.names(taxo.all), invert = T), ]

# 把精确到目（order）的结果写入文件。
write.table(taxo.all, "micro.order.tsv", 
            row.names = T, col.names = T, 
            quote = F, sep = "\t")

# 删除目（order）的结果。
taxo.all <- taxo.all[grep("o__", row.names(taxo.all), invert = T), ]

# 把精确到纲（class）的结果写入文件。
write.table(taxo.all, "micro.class.tsv", 
            row.names = T, col.names = T, 
            quote = F, sep = "\t")

# 删除纲（class）的结果。
taxo.all <- taxo.all[grep("c__", row.names(taxo.all), invert = T), ]

# 把精确到门（phylum）的结果写入文件。
write.table(taxo.all, "micro.phylum.tsv", 
            row.names = T, col.names = T, 
            quote = F, sep = "\t")
