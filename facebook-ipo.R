#!/usr/bin/env R
# --no-restore --no-save -f $0

ipo = read.csv("data/ipo-data-nyt_from_how-the-facebook-offering-compares.csv", row.names=1)

ipo$lrMVMP = log(ipo$rMVMP)
ipo$lrMVOP = log(ipo$rMVOP)

attach(ipo)

ipo.correlation_pearson = cor.test(ipo$lrMVMP, ipo$lrMVOP, method="pearson")
ipo.correlation_spearman = cor.test(ipo$lrMVMP, ipo$lrMVOP, method="spearman")
cor(ipo)

symnum(cor(ipo))

plot(ipo$lrMVMP, ipo$lrMVOP, xlab="lrMVMP", ylab="lrMVOP", pch=21)
abline(lm(ipo$lrMVOP ~ ipo$lrMVMP))
cor.test(ipo) #fails
