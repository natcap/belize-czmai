# Created by Jade D. 
# 2022June

##### Packages #####
library(gdalUtils)
library(ggplot2)
library(gridExtra)
library(cowplot)


##### A/ Create bar chart - habitat 2016 - Coastal Planning scale - lobster tail lbs ####
setwd("E:/GreenFin/04_lobster/lobster_outputs")

# import dataframe
lobster_outputs <- read.csv("lobster_outputs.csv")
names(lobster_outputs)

lobster_outputs$Landings <- factor(lobster_outputs$Landings,  # Change ordering manually
                                   levels = c("Lobster Tails"))

# set the order for the years
lobster_outputs$Scenario <- factor(lobster_outputs$Scenario,  # Change ordering manually
                          levels = c("2025", "2020", "2016"))

# set the order of planning units (north to south)
lobster_outputs$CPU <- factor(lobster_outputs$CPU,  # Change ordering manually
                              levels = c("9-Southern Region","8-South Central Region","7-South Northern Region","6-Lighthouse Reef Atoll","5-Turneffe Atoll","4-Central Region","3-Caye Caulker","2-Ambergris Caye","1-Northern Region"))

## set custom colors
year_cols <- c("deepskyblue", "darkorchid", "deeppink")
names(year_cols) <- c("2016", "2020", "2025")

# build the bar chart
ggbars <- ggplot(lobster_outputs) +
  geom_bar(aes(x=CPU, y=lbs, fill=Scenario), position="dodge", stat="identity") +
  scale_fill_manual(values=year_cols) +
  labs(title = "Lobster catch", x = "Coastal Planning Units", y = "Pounds (lbs)") +
  facet_wrap("Landings") +
  theme_bw() +
  theme(axis.title.x = element_text(size = 12, face="bold"), 
        axis.title.y = element_text(size = 12, face="bold"), 
        axis.text = element_text(size = 12, color = "black"),
        strip.text.x = element_text(size = 12),
        legend.title = element_text(colour="black", size=12, face="bold"),
        legend.text = element_text(colour="black", size=12),
        legend.position="bottom")
plot_grid(ggbars + coord_flip() + scale_y_continuous(labels = scales::comma))

# export and displays as values
pdf(file.path("E:/GreenFin/04_lobster", paste("_barplot_cpu_lobster_outputs_catch.pdf")),
    width = 7, height = 5)
plot_grid(ggbars + coord_flip() + scale_y_continuous(labels = scales::comma))
dev.off()

##### B/ Create bar chart - habitat 2016 - Coastal Planning scale - revenue ####
setwd("E:/GreenFin/04_lobster/lobster_outputs")

# import dataframe
lobster_outputs <- read.csv("lobster_outputs.csv")
names(lobster_outputs)

lobster_outputs$Landings <- factor(lobster_outputs$Landings,  # Change ordering manually
                                   levels = c("Lobster Tails"))

# set the order for the years
lobster_outputs$Scenario <- factor(lobster_outputs$Scenario,  # Change ordering manually
                                   levels = c("2025", "2020", "2016"))

# set the order of planning units (north to south)
lobster_outputs$CPU <- factor(lobster_outputs$CPU,  # Change ordering manually
                              levels = c("9-Southern Region","8-South Central Region","7-South Northern Region","6-Lighthouse Reef Atoll","5-Turneffe Atoll","4-Central Region","3-Caye Caulker","2-Ambergris Caye","1-Northern Region"))

## set custom colors
year_cols <- c("deepskyblue", "darkorchid", "deeppink")
names(year_cols) <- c("2016", "2020", "2025")

# build the bar chart
ggbars <- ggplot(lobster_outputs) +
  geom_bar(aes(x=CPU, y=BZD, fill=Scenario), position="dodge", stat="identity") +
  scale_fill_manual(values=year_cols) +
  labs(title = "Lobster Tail Revenue", x = "Coastal Planning Units", y = "Lobster Tail Revenue (BZ dollars)") +
  facet_wrap("Landings") +
  theme_bw() +
  theme(axis.title.x = element_text(size = 12, face="bold"), 
        axis.title.y = element_text(size = 12, face="bold"), 
        axis.text = element_text(size = 12, color = "black"),
        strip.text.x = element_text(size = 12),
        legend.title = element_text(colour="black", size=12, face="bold"),
        legend.text = element_text(colour="black", size=12),
        legend.position="bottom")
plot_grid(ggbars + coord_flip() + scale_y_continuous(labels = scales::comma))

# export and displays as values
pdf(file.path("E:/GreenFin/04_lobster", paste("_barplot_cpu_lobster_outputs_revenue.pdf")),
    width = 7, height = 5)
plot_grid(ggbars + coord_flip() + scale_y_continuous(labels = scales::comma))
dev.off()
