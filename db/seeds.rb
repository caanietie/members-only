# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
 
users = User.create([
  { id: 1, username: "aakjhonclems", email: "aakjhonclems@gmail.com", password: "aakjhonclems" },
  { id: 2, username: "JerryAppel", email: "JerryAppel@email.com", password: "JerryAppel" },
  { id: 3, username: "johnbaker", email: "johnbaker@baker.com", password: "johnbaker" },
  { id: 4, username: "michael_pens", email: "michael_pens@email.com", password: "michael_pens" },
  { id: 5, username: "BobMichimoto", email: "bobmichimoto@bob.com", password: "BobMichimoto" },
  { id: 6, username: "Linda_Smith", email: "linda_smith@linda_smith.com", password: "Linda_Smith" },
  { id: 7, username: "RobertFunnell", email: "funnelli@robert.com", password: "RobertFunnell" },
  { id: 8, username: "billcheckal", email: "billcheckal@anothermail.com", password: "billcheckal" },
  { id: 9, username: "JedStyle", email: "JedStyle@jedstyle.com", password: "JedStyle" },
  { id: 10, username: "Adrian_Hansen", email: "adrian_hansen@anothermail.com", password: "Adrian_Hansen" },
  { id: 11, username: "harold_percival", email: "harold@percival.com", password: "harold_percival" }
])
11.times do |n|
  File.open("db/story#{n+1}.txt") do |file|
    Post.create({user_id: n+1, title: file.readline, body: file.read})
  end
end
