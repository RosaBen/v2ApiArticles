require 'faker'

puts "🌱 Début des seeds..."

JwtDenylist.destroy_all
Article.destroy_all
User.destroy_all

puts "🧹 Nettoyage de la base de données... "

tables = %w[users articles jwt_denylists]
tables.each do |table|
  ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='#{table}';")
end

puts "👤 Création des utilisateurs..."

userRosa = User.create(
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password',
  username: 'Rosa'
)

users = 5.times.map do
  User.create(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    username: Faker::Internet.username
  )
end

userAll = User.all

puts "📰 Création des articles..."

30.times do
  Article.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 5),
    user: userAll.sample
  )
end

puts "\n✅ Seeds terminés !"