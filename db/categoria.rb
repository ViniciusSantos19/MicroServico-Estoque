require 'app/models/categorium'

Categorium.create(nome: 'barba', descricao: 'produtos para a barba do cliente')
Categorium.create(nome: 'Cabelo', descricao: 'produtos para os cabelos do cliente')
Categorium.create(nome: 'Máquina', descricao: 'máquina de cortar cabelo')
Categorium.create(nome: 'Navalha', descricao: 'navalha para alinhar pé do cabelo')

puts "Criadas #{Categorium.count} categorias."
