# GRAPHICS 

install.packages("gridExtra")
library(gridExtra)
library(tidyverse)

# Now we see with histograms the quotes of common and unique followers in every group

# FAR RIGHT CULTURE

sub1 = subset(id_follow_grp, frc == 1)

frc1 = ggplot(sub1, aes(factor(frc), fill = factor(rwc))) +
  geom_bar(position="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Far-Right Culture Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Right-wing Culture")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

frc2 = ggplot(sub1, aes(factor(frc), fill = factor(frp))) +
  geom_bar(position="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Far-Right Culture Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Far-Right Parties")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

frc3 = ggplot(sub1, aes(factor(frc), fill = factor(rwp))) +
  geom_bar(position="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Far-Right Culture Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Right-wing Parties")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

# We merge all the three plots in one

install.packages("cowplot")
library(cowplot)

plot_grid(frc2, frc1, frc3, nrow = 3, rel_widths = c(0.75,0.75, 0.75))+
  ggtitle("Total Followers Far-Right Culture")+
  theme(plot.title = element_text(family = "Helvetica", face = "bold", size = (15)))

# FAR RIGHT PARTIES

sub2 = subset(id_follow_grp, frp == 1)

frp1 = ggplot(sub2, aes(factor(frp), fill = factor(frc))) +
  geom_bar(position="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Far-Right Parties Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Far-Right Culture")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

frp2 = ggplot(sub2, aes(factor(frp), fill = factor(rwc))) +
  geom_bar(position="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Far-Right Parties Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Right-wing Culture")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

frp3 = ggplot(sub2, aes(factor(frp), fill = factor(rwp))) +
  geom_bar(position="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Far-Right Parties Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Right-wing Parties")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

plot_grid(frp1, frp2, frp3, nrow = 3, rel_widths = c(0.75,0.75, 0.75))+
  ggtitle("Total Followers Far-Right Parties")+
  theme(plot.title = element_text(family = "Helvetica", face = "bold", size = (15)))

# RIGHT-WING CULTURE

sub3 = subset(id_follow_grp, rwc == 1)

rwc1 = ggplot(sub3, aes(factor(rwc), fill = factor(frc))) +
  geom_bar(position="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Right-wing Culture Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Far-Right Culture")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

rwc2 = ggplot(sub3, aes(factor(rwc), fill = factor(frp))) +
  geom_bar(sub3="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Right-wing Culture Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Far-Right Parties")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

rwc3 = ggplot(sub3, aes(factor(rwc), fill = factor(rwp))) +
  geom_bar(position="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Right-wing Culture Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Right-wing Parties")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

plot_grid(rwc1, rwc2, rwc3, nrow = 3, rel_widths = c(0.75,0.75, 0.75))+
  ggtitle("Total Followers Right-wing Culture")+
  theme(plot.title = element_text(family = "Helvetica", face = "bold", size = (15)))

# RIGHT-WING PARTIES

sub4 = subset(id_follow_grp, rwp == 1)

rwp1 = ggplot(sub4, aes(factor(rwp), fill = factor(frc))) +
  geom_bar(position="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Right-wing Parties Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Far-Right Culture")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

rwp2 = ggplot(sub4, aes(factor(rwp), fill = factor(frp))) +
  geom_bar(sub3="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Right-wing Parties Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Far-Right Parties")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

rwp3 = ggplot(sub4, aes(factor(rwp), fill = factor(rwc))) +
  geom_bar(position="stack")+
  geom_text(aes(label = paste0(round(after_stat(count)/sum(count)*100,1), "%")), stat = "count", position = position_stack(vjust = 0.5), colour = "black", size = 5) +
  xlab("Right-wing Parties Follower") +
  ylab("Number of Total Followers")+
  scale_y_continuous(labels = scales::comma)+
  labs(fill = "Right-wing Culture")+
  scale_fill_hue(labels = c('Not Follow','Follow'))+
  coord_flip()

plot_grid(rwp1, rwp2, rwp3, nrow = 3, rel_widths = c(0.75,0.75, 0.75))+
  ggtitle("Total Followers Right-wing Parties")+
  theme(plot.title = element_text(family = "Helvetica", face = "bold", size = (15)))





