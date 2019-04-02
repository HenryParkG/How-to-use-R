library(dplyr)
exam<-read.csv("csv_exam.csv")
exam
exam %>% filter(class==2)
exam %>% filter(class!=3)
exam %>% filter(english <= 70)
exam %>% filter(class==1 & english>=60)

exam %>% select(english)
exam %>% select(math)
exam %>% select(class, math)

exam %>% filter(class==1) %>% select(english)
exam %>% select(id, math) %>% head

exam %>% arrange(math)
exam %>% arrange(desc(math))

exam %>%
  mutate(total=math+english+science) %>% 
  head

exam  %>% 
  mutate(total=math+english+science,
         mean=(math+english+science)/3) %>% 
  head

exam %>% 
  mutate(test=ifelse(science>=60,"pass", "fail")) %>% 
  head


exam %>%
  mutate(total=math+english+science) %>% 
  arrange(total) %>% 
  head

exam %>% 
  summarise(mean_math=mean(math))

exam %>%
  group_by(class) %>% 
  summarise(mean_math=mean(math))

library(ggplot2)
mpg<-data.frame(ggplot2::mpg)
mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  head(10)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)
