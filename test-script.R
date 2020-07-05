library(readr)
library(neuralnet)

scale01 <- function(x){
  (x - min(x)) / (max(x) - min(x))
}

data <- read.delim("cleveland.data")
colnames(data) <- "data"
class(data$sex)
data <- data %>% 
  separate(data,into=c("age","sex","chestpain","restingbp","cholestoral","fbs","restecg","maxheartrate","exerciseangina","oldpeak","slope","ca","thal","num"),sep = ",") 
  mutate()
  mutate(age=scale01(age))

model.ann <- neuralnet(num ~ ., data = data)
