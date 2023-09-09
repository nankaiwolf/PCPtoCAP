#外周血白细胞
PeripheralWC <- data.frame(
  group = rep(c("CAP", "PCP"), each = 6),
  WhiteCell = c(7.8, 8.6, 18.5, 8.0, 8.3, 11.0,
                8.3, 17.0, 7.3, 1.6, 5.4, 9.25)
)
PeripheralLy <- data.frame(
  group = rep(c("CAP", "PCP"), each = 6),
  Lymphocyte = c(7.8*0.09, 8.6*0.054, 18.5*0.115, 8.0*0.083, 8.3*0.138, 11.0*0.128,
                 8.3*0.113, 17.0*0.076, 7.3*0.059, 1.6*0.131, 5.4*0.027, 9.25*0.05)
)
PeripheralNe <- data.frame(
  group = rep(c("CAP", "PCP"), each = 6),
  Neutrophil = c(7.8*0.867, 8.6*0.859, 18.5*0.774, 8.0*0.81, 8.3*0.766, 11.0*0.796,
                 8.3*0.85, 17.0*0.857, 7.3*0.917, 1.6*0.739, 5.4*0.943, 9.25*0.859)
)
Peripheral.White.Cells <- PeripheralWC$WhiteCell
Peripheral.Lymphocytes <- PeripheralLy$Lymphocyte
Peripheral.Neutrophils <- PeripheralNe$Neutrophil
boxplot(Peripheral.White.Cells ~ PeripheralWC$group, 
        data.frame(Peripheral.White.Cells, PeripheralWC$group))
wilcox.test(WhiteCell ~ group, data = PeripheralWC)

boxplot(Peripheral.Lymphocytes ~ Peripheral$group, 
        data.frame(Peripheral.Lymphocytes, Peripheral$group))
wilcox.test(Lymphocyte ~ group, data = PeripheralLy)

boxplot(Peripheral.Neutrophils ~ Peripheral$group, 
        data.frame(Peripheral.Neutrophils, Peripheral$group))
wilcox.test(Neutrophil ~ group, data = PeripheralNe)
#非常遗憾，外周血白细胞总数、淋巴细胞和中性粒细胞都没有统计学差异。

#现在进行淋巴细胞亚群统计
PeripheralTCD4<- data.frame(
  group = rep(c("CAP", "PCP"), each = 3),
  TCD4 = c(251, 381, 424,
           162, 36, 172)
)
Peripheral.T.CD4.Lymphocyte <- PeripheralTCD4$TCD4
boxplot(Peripheral.T.CD4.Lymphocyte ~ PeripheralTCD4$group,
        data.frame(Peripheral.T.CD4.Lymphocyte, PeripheralTCD4$group))
wilcox.test(TCD4 ~ group, data = PeripheralTCD4)

PeripheralTCD8<- data.frame(
  group = rep(c("CAP", "PCP"), each = 3),
  TCD8 = c(162, 377, 252,
           448, 91, 127)
)
Peripheral.T.CD8.Lymphocyte <- PeripheralTCD8$TCD8
boxplot(Peripheral.T.CD8.Lymphocyte ~ PeripheralTCD8$group,
        data.frame(Peripheral.T.CD8.Lymphocyte, PeripheralTCD8$group))
wilcox.test(TCD8 ~ group, data = PeripheralTCD8)

PeripheralB<- data.frame(
  group = rep(c("CAP", "PCP"), each = 3),
  B = c(251, 381, 424,
        162, 36, 172)
)
Peripheral.B.Lymphocyte <- PeripheralB$B
boxplot(Peripheral.B.Lymphocyte ~ PeripheralB$group,
        data.frame(Peripheral.B.Lymphocyte, PeripheralB$group))
wilcox.test(B ~ group, data = PeripheralB, paired = F)
#只有CD4和B淋巴细胞亚群具有显著性倾向，P均为0.1。

#将BALF当中的三个分类巨噬细胞、淋巴细胞、中性粒细胞进行统计。
BALFMa<- data.frame(
  group = rep(c("CAP", "PCP"), each = 6),
  Ma = c(10.0, 9.0, 94.0, 86.0, 76.0, 15.0,
         22.0, 95.0, 9.0, 2.0, 22.0, 29.5)
)
BALF.Macrophages <- BALFMa$Ma
boxplot(BALF.Macrophages ~ BALFMa$group,
        data.frame(BALF.Macrophages, BALFMa$group))
wilcox.test(Ma ~ group, data = BALFMa, paired = F)

BALFLy<- data.frame(
  group = rep(c("CAP", "PCP"), each = 6),
  Ly = c(11.0, 6.0, 4.0, 13.5, 7.0, 66.0,
         50.0, 4.5, 30.0, 73.0, 16.0, 59.0)
)
BALF.Lymphocytes <- BALFLy$Ly
boxplot(BALF.Lymphocytes ~ BALFLy$group,
        data.frame(BALF.Lymphocytes, BALFLy$group))
wilcox.test(Ly ~ group, data = BALFLy, paired = F)

BALFNe<- data.frame(
  group = rep(c("CAP", "PCP"), each = 6),
  Ne = c(79.0, 85.0, 2.0, 0.5, 17.0, 18.0,
         28.0, 0.5, 61.0, 25.0, 62.0, 9.5)
)
BALF.Neutrophils <- BALFNe$Ne
boxplot(BALF.Neutrophils ~ BALFNe$group,
        data.frame(BALF.Neutrophils, BALFNe$group))
wilcox.test(Ne ~ group, data = BALFNe, paired = F)
