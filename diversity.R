# 读入mpa格式的tsv物种表格文件
taxo.count <- read.csv("micro.species.tsv", 
                       sep = "\t", header = T)

# 分组信息
metadata <- data.frame(Group = factor(c('CAP', 'CAP', 'CAP', 'CAP', 'CAP', 'CAP',
                                        'PCP', 'PCP', 'PCP', 'PCP', 'PCP', 'PCP')), 
                       Series = c('01', '02', '03', '04', '05', '06', 
                                  '07', '08', '09', '10', '11', '12'),
                       Samples = c('BALF', 'BALF', 'BALF', 'BALF', 'BALF', 'BALF',
                                   'BALF', 'BALF', 'BALF', 'BALF', 'BALF', 'BALF'),
                       row.names = colnames(taxo.count)[1:12])

# 导入相关的运算库
library(vegan)
library(amplicon)
library(pheatmap)
library(RColorBrewer)

# 计算α多样性指标
shannon.wiener <- diversity(t(taxo.count), index = "shannon")
simpson <- diversity(t(taxo.count), index = "simpson")
inverse.simpson <- diversity(t(taxo.count), index = "inv")
S <- specnumber(t(taxo.count))
pielou <- shannon.wiener/log(S)

# 建立α多样性数据框
alpha.diversity <- rbind(shannon.wiener, simpson, inverse.simpson, S, pielou)
# 选择出PCP组和CAP组
alpha.diversity.pcp <- alpha.diversity[ , 7:12]
alpha.diversity.cap <- alpha.diversity[ , 1:6]
# 使用Mann-Whitney U非参数检验比较shannon.wiener。
fivenum(alpha.diversity.pcp[1, ])
fivenum(alpha.diversity.cap[1, ])
wilcox.test(alpha.diversity.cap[1, ], alpha.diversity.pcp[1, ])
# 使用Mann-Whitney U非参数检验比较pielou。
fivenum(alpha.diversity.pcp[5, ])
fivenum(alpha.diversity.cap[5, ])
wilcox.test(alpha.diversity.cap[5, ], alpha.diversity.pcp[5, ])
# α多样性指标绘制箱线图
boxplot(shannon.wiener ~ metadata$Group, data.frame(shannon.wiener, metadata$Group))
boxplot(pielou ~ metadata$Group, data.frame(pielou, metadata$Group))

# 计算β多样性指标
bray <- vegdist(t(taxo.count), method = "bray")
bray.matrix <- as.matrix(bray)
# β多样性绘制PCoA图
p <- beta_pcoa(bray.matrix, metadata, "Group")
p
beta_pcoa_stat(bray.matrix, metadata, "Group", result = "beta_pcoa_stat.txt")
pheatmap(bray.matrix, color = colorRampPalette(brewer.pal(7,"RdYlBu"))(100))
