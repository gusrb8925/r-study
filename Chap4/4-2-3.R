DF <- read.csv("example_cancer.csv", stringsAsFactors=F, na="��Ͼ���")
str(DF)

attach(DF)
mean(age)
summary(age)

boxplot(age, range=1.5)
grid()

distIQR <- IQR(age,na.rm=T)

posIQR <- quantile(age, prob=c(0.25, 0.75), na.rm=T)
posIQR

DownWhisker <- posIQR[[1]] - distIQR*1.5
UpWhisker <- posIQR[[2]] + distIQR*1.5
DownWhisker; UpWhisker

Outlier <- subset(DF, subset=(age < DownWhisker | age > UpWhisker ))
Outlier