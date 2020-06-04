

# packages I'll use
pkgList <- c("MASS",
             "lattice",
             "lubridate", "plyr", "dplyr", "tibble",
             "ggplot2", "gghighlight", "ggiraph",
             "dataMaid",
             "explore"
            )
inst <- pkgList %in% installed.packages()
if (length(pkgList[!inst]) > 0) {
   install.packages(pkgList[!inst], dep=TRUE,                                                      repos="https://cloud.r-project.org")
   }
lapply(pkgList, library, character.only = TRUE, quietly=TRUE)



#
dataMaid::makeCodebook(barley, output = "html", replace = TRUE)


barley %>% explore_all()
barley %>% explore_all( target = year)


explore_all(barley)
explore_all(barley, target = year)


```

##########################################3
# Cleveland dotplot of Barley Yield by variety, site, and year
barley$site <- factor(barley$site, levels = sort(levels(barley$site)))
barley$variety <- factor(barley$variety, levels = sort(levels(barley$variety)))
dp <- ggplot(barley, aes(yield, variety, colour = year)) +
     geom_point() + facet_wrap(~site, ncol = 1) +
     xlab("Yield (bushels)") + ylab("Variety") +
     ggtitle("Immer et al. 1934 Barley Yield Trials in Minnesota")
# dp

meanyield <- aggregate(yield ~ variety, data = barley, FUN = mean)
VbyY <- as.character(meanyield$variety)[order(meanyield$yield)] #, decreasing = TRUE)]

barley$variety <- factor(barley$variety, levels = VbyY)
dp2 <- ggplot(barley, aes(yield, variety, colour = year)) +
     geom_point() + facet_wrap(~site, ncol = 1) +
     xlab("Yield (bushels)") + ylab("Variety") +
     ggtitle("Immer et al. 1934 Barley Yield Trials in Minnesota") +
     scale_colour_brewer(palette = "Set1")
dp2 + ggtitle("Barley Yield Trials in Minnesota")

dp2 + facet_wrap(~site, ncol = 2)


####################################################
tbarley <- as_tibble(barley)
explore(tbarley)


####################################
data(iris)  # load from one package or another
g <- ggobi(iris)
glyph_colour(g[1]) <- iris$Species






############################################

musselplot <- ggplot(photoplots, aes(Date, Count, color = Zone)) +
              geom_line(group = ZP) +
              geom_point(group =ZP, shape = Plot) +
              ylab("% of Points Occupied") +
              xlab("Year") +
              ggtitle("Mytilus californianus")
musselplot
