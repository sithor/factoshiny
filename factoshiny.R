
## install pacman package manager
if(!require(pacman)) install.packages("pacman")

## installs packages required and makes functions available
pacman::p_load(magrittr, skimr, FactoMineR, Factoshiny, rio)


bloods <- rio::import("./data/Blood Results_baseline.xlsx", na = "NA")

## no duplicated participant values
bloods[duplicated(bloods$Participant),]

## Check missing and ranges

bloods %>% skim

## remove missing values

bloods <- na.omit(bloods)

## set-up data.frame so that plots are appropriately labelled with participant codes
rownames(bloods) <- bloods$Participant

## Remove participant code column
bloods <- bloods[, -1]

## Use code below to scale data
## bloods <- scale(bloods)

# Principal Component Analysis with Factoshiny:
res.shiny <- Factoshiny::PCAshiny(bloods)

# Find your app the way you left it (by clicking on the "Quit the app" button)
res.shiny2 <- PCAshiny(res.shiny)

#PCAshiny on a result of a PCA
res.pca <- PCA(decathlon, quanti.sup = 11:12, quali.sup=13)
res.shiny <- PCAshiny(res.pca)