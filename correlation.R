# 读入临床数据
clinic.data <- read.table("corr.data.blood.tsv", header = T, sep = "\t", row.names = 1)
# 读入物种“门”数据
phylum.data <- read.table("tax.phylum.count.tsv", header = T, sep = "\t", row.names = 1)
# 选择排名前10的物种
phylum.top10 <- phylum.data[c('Proteobacteria', 'Firmicutes',
                              'Actinobacteria', 'Bacteroidetes',
                              'Cyanobacteria', 'Tenericutes',
                              'Chloroflexi', 'Spirochaetes',
                              'Deinococcus-Thermus', 'Fusobacteria'), ]
# 载入运行库
library(corrplot)

# 数据拼接
total.data <- cbind(clinic.data, t(phylum.top10))
# 去除空值的行
total.data <- na.omit(total.data)
# 去除零值的列
total.data <- total.data[ , which(colSums(total.data) > 0)]
# 生成相关系数方阵
corr.matrix <- cor(total.data)
corrplot(corr.matrix, tl.cex = 0.4)
corrplot.mixed(corr.matrix, tl.pos = "lt", tl.cex = 0.7, number.cex = 0.7)

# 缩减相关系数方阵为物种与临床指标相关矩阵
corr.tailored.matrix <- corr.matrix[1:14, 15:24]
corrplot(corr.tailored.matrix, is.corr = FALSE, tl.cex = 1.0)
