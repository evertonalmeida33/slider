#language: pt
Funcionalidade: Busca

Contexto:
  Dado que acesso a pagina de buscas

Cenario: Buscar por cirurgia especifica
  Quando buscar pela "Cirurgia de amígdala"
  Entao devo ver apenas a cirurgia filtrada nos resultados

@teste
Cenario: Filtro por valor
  Quando filtrar pelo valor "6400" e "6500"
  Então devo ver apenas a "Cirurgia de varizes"

@hospital
Cenario: Filtro por hospital
  Quando filtrar pelo hospital "Day Clinic Fleury"
  E buscar pela "Cirurgia refrativa"
  Entao devo ver apenas a cirurgia filtrada nos resultados
  E apenas no hospital filtrado