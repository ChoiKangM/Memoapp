# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do |i|
  id =[1,2,3,4,5,6,7,8].sample
  Memo.create(title: "#{i+1}째 글입니다", content: "#{i%10}#{i%10}#{i%10}",user_id: id)  
end
9.times do |t|
  User.create(email: "#{t*111}@#{t*111}.com", password: "#{t*111111}")
end