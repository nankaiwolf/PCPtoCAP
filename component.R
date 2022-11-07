# 载入运行库
library(amplicon)

# 读入细菌“门”级别的reads数据
phylum.count <- read.table("bact.phylum.tsv",
                           header = T, sep = "\t", row.names = 1)
# 计算比例
phylum.abund <- data.frame(cap.4383535 = phylum.count$cap.4383535 / sum(phylum.count$cap.4383535) * 100,
                           cap.4386223 = phylum.count$cap.4386223 / sum(phylum.count$cap.4386223) * 100,
                           cap.4388092 = phylum.count$cap.4388092 / sum(phylum.count$cap.4388092) * 100,
                           cap.4391097 = phylum.count$cap.4391097 / sum(phylum.count$cap.4391097) * 100,
                           cap.4391244 = phylum.count$cap.4391244 / sum(phylum.count$cap.4391244) * 100,
                           cap.4395785 = phylum.count$cap.4395785 / sum(phylum.count$cap.4395785) * 100,
                           pcp.4311574 = phylum.count$pcp.4311574 / sum(phylum.count$pcp.4311574) * 100,
                           pcp.4378760 = phylum.count$pcp.4378760 / sum(phylum.count$pcp.4378760) * 100,
                           pcp.4383785 = phylum.count$pcp.4383785 / sum(phylum.count$pcp.4383785) * 100,
                           pcp.4385354 = phylum.count$pcp.4385354 / sum(phylum.count$pcp.4385354) * 100,
                           pcp.4386363 = phylum.count$pcp.4386363 / sum(phylum.count$pcp.4386363) * 100,
                           pcp.4388658 = phylum.count$pcp.4388658 / sum(phylum.count$pcp.4388658) * 100,
                           row.names = rownames(phylum.count))
# 设置metadata的分组
metadata <- data.frame(Group = factor(c('CAP', 'CAP', 'CAP', 'CAP', 'CAP', 'CAP',
                                        'PCP', 'PCP', 'PCP', 'PCP', 'PCP', 'PCP')), 
                       Series = c('01', '02', '03', '04', '05', '06', 
                                  '07', '08', '09', '10', '11', '12'),
                       Samples = c('BALF', 'BALF', 'BALF', 'BALF', 'BALF', 'BALF',
                                   'BALF', 'BALF', 'BALF', 'BALF', 'BALF', 'BALF'),
                       row.names = colnames(phylum.abund)[1:12])
# 对数据进行绘图
p <- tax_stackplot(phylum.abund, metadata, groupID = "Group", topN = 10)
p
p <- tax_circlize(phylum.abund, metadata, topN = 5, groupID = 'Group')
p
# 提取柔膜菌门的构成数据进行比较
