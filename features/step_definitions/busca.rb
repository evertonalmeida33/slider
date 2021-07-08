Dado('que acesso a pagina de buscas') do
  @page.call(Busca).go
end

Quando('buscar pela {string}') do |nome_cirurgia|
  @cirurgia = nome_cirurgia
  @page.call(Busca).realizar_busca(@cirurgia)
end

Entao('devo ver apenas a cirurgia filtrada nos resultados') do
  expect(@page.call(Busca).resultado_busca).to eql @cirurgia
end

Quando('filtrar pelo valor {string} e {string}') do |valor_min, valor_max|
  @page.call(Busca).filtrar_por_valor(valor_min, valor_max)
end

Então('devo ver apenas a {string}') do |nome_cirurgia|
  expect(@page.call(Busca).resultado_busca).to eql nome_cirurgia
end

Quando('filtrar pelo hospital {string}') do |nome_hospital|
  @hospital = nome_hospital
  @page.call(Busca).filtrar_por_hospital(@hospital)
end

Entao('apenas no hospital filtrado') do
  
end