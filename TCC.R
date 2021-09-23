library(rio)
library(tidyverse)

data <- import("TCC.csv")

str(data)

# Tratamento do banco de dados

BD <- data %>%
  
  rename(Regiao = "Região",
         Repr_Policial = "Repressão_Policial", 
         Cidade = " Cidade") %>%
  
  mutate(Cidade = case_when(Cidade == "São Paulo" ~ "Sao Paulo", 
                            Cidade == "Pedro Osório" ~ "Pedro Osorio",
                            Cidade == "Mauá" ~ "Maua"), 
         
         Coletivo = case_when(Coletivo == "Não" ~ "Nao", 
                              Coletivo == "Sim" ~ "Sim"), 
         
         Repr_Policial = case_when(Repr_Policial == "Não" ~ "Nao", 
                                   Repr_Policial == "Sim" ~ "Sim"))

str(BD)


# Criacao de grafico para visualizar a quantidade de artistas 
# por tipo de atuacao

BD %>%
  select(Tipo) %>%
  table() %>% 
  barplot(main = "Tipo de artistas entrevistados",
          ylab = "Quantidade", 
          xlab = "Tipo de artista",
          border = NA,
          col = "#CD5B45")


# Tabela para visualizar quantidade de artistas que ja sofreram
# repressao policial - dividido por tipo de atuacao

table(BD$Tipo, BD$Repr_Policial) 
 






