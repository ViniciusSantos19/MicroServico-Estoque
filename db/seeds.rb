# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Categorium.create(nome: 'barba', descricao: 'produtos para a barba do cliente')
Categorium.create(nome: 'Cabelo', descricao: 'produtos para os cabelos do cliente')
Categorium.create(nome: 'Máquina', descricao: 'máquina de cortar cabelo')
Categorium.create(nome: 'Navalha', descricao: 'navalha para alinhar pé do cabelo')

puts "Criadas #{Categorium.count} categorias."
