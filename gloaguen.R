# Analyse discriminante
library(MASS)
resultat_lda <- lda(Condition ~ Sujets + APRoM + MLRoM + Vm + Aire, data = data_scatter)

library(tidyverse)

classe_predite = predict(resultat_lda)$class

table(Prediction = classe_predite, 
      Verite = data_scatter$Condition)
predict(resultat_lda)$x %>% 
  as.data.frame() %>% 
  mutate(Condition = data_scatter$Condition) %>% 
  ggplot(aes(x = LD1, y = LD2, color = Condition)) +
  geom_point()
# Regression logistique
