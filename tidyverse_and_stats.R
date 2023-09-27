#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                                                                                ##
# tidyverse and stats practice                                                   ##
# Data are current as of 2023-09-27                                              ##
# Data source: Abigail Mish                                                      ##
# R code prepared by Abigail Mish                                                ##
# Last updated 2023-09-27                                                        ##
#                                                                                ##
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# SUMMARY:


# Required Files (check that script is loading latest version):
# FILE.csv

# Associated Scripts:
# FILE.R

# TO DO 

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# TABLE OF CONTENTS                                                            ####
#                                                                                 +
# RECENT CHANGES TO SCRIPT                                                        +
# LOAD PACKAGES                                                                   +
# READ IN AND PREPARE DATA                                                        +
# MANIPULATE DATA                                                                 +
#                                                                                 +
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# RECENT CHANGES TO SCRIPT                                                     ####
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# LOAD PACKAGES                                                                ####
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

library(tidyverse)
library(viridis)
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# READ IN AND PREPARE DATA                                                     ####
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

daphnia <- read_csv("data/daphnia.csv") #copying data set 
summary(daphnia) #Summary of values
str(daphnia) #structure of data 
head(daphnia) #shows all of columns and first rows 
glimpse(daphnia) #basic summary of structure 
t.test(daphnia$winter, daphnia$summer) #checking to see if their different
help(t.test) #just getting help with paired 
t.test(daphnia$summer, daphnia$winter, paired=TRUE) #worked for paired t test 

#loading in more data set

heights <- read_csv("data/heights.csv") #adding the data set 
help(t.test) #checking for directions for paired t test 
t.test(height~sex, data=heights) #paired, 2 sample t test (welch)

#Loading another data set

trout <- read_csv("data/trout.csv") #adding new data set 
trout_g <- trout %>% #in order to name object
  filter(stream == "glacier") #the glacier data for that object

trout_kokanee <- trout%>% #naming object
  filter(species == "kokanee") #the kokanee data for that object

rm(trout_g) #removing mistake object

trout_sex <- trout%>% #naming trout data and pipe
  select(sex) #only choosing to take data from sex
trout_sex_stream <- trout%>% #naming data and pipe
  select(stream, sex) #choosing two columns to get data from 

help(select) #need help with format 

trout_mayfly_sex <- trout%>% #naming object, pipe
  filter(stream == "mayfly")%>% #order matters!!!!
  select(sex, stream) #must include stream to run filter above (correct way)
  
trout_mayfly_sex <- trout%>%
  select(stream)%>% #only looking stream!
  filter(stream == "mayfly")%>% # choosing mayfly from stream 
  select(sex) #can't do ! already got rid of 

select(trout_mayfly_sex$sex) #good try, but not correct 

conversion_lengths <- trout%>%
  mutate(inches=length*0.393701)

write_csv(conversion_lengths, "data/trout_coversion_lengths.csv")

data(mtcars)
mtcars%>%
  mutate(gpm=1/mpg)
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# MANIPULATE DATA                                                              ####
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


############### SUBSECTION HERE

####
#<<<<<<<<<<<<<<<<<<<<<<<<<<END OF SCRIPT>>>>>>>>>>>>>>>>>>>>>>>>#

# SCRATCH PAD ####