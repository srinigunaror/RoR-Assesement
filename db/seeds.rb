
user1 = User.create(name: Faker::Name.name, email: Faker::Internet.email)
user2 = User.create(name: Faker::Name.name, email: Faker::Internet.email)

10.times.each do |i|
  Task.create({
  	title: Faker::Book.title,
  	description: Faker::Lorem.sentence,
  	due_date: (Date.today..Date.today+3.days).to_a.sample,
  	assigned_to_id: [user1.id, user2.id].sample,
  	priority: Task.priorities.keys.sample
  })
end
