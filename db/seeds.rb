require 'faker'

puts "🌱 Début des seeds..."


Article.destroy_all


puts "📰 Création des articles..."

30.times do
  Article.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 5),
  )
end

puts "\n✅ Seeds terminés !"