# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始しました"


yamaguchi = User.find_or_create_by!(email: "adoresu@g.com") do |user|
  user.team = "電装"
  user.name = "山口"
  user.telephone_number = "09099990000"
  user.password = "pasuwado"
end

tanaka = User.find_or_create_by!(email: "adoresu2@g.com") do |user|
  user.team = "機装"
  user.name = "田中"
  user.telephone_number = "09088880000"
  user.password = "pasuwado2"
end

shimizu = User.find_or_create_by!(email: "adoresu3@g.com") do |user|
  user.team = "塗装"
  user.name = "清水"
  user.telephone_number = "09077770000"
  user.password = "pasuwado3"
end

watanabe = User.find_or_create_by!(email: "adoresu4@g.com") do |user|
  user.team = "船装"
  user.name = "渡辺"
  user.telephone_number = "09066660000"
  user.password = "pasuwado4"
end

example = Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "adminpasuwado"
end

5.times{|i|Project.find_or_create_by!(name: "project-#{i}")}
Project.find_or_create_by!(name: "すごいproject")
Project.find_or_create_by!(name: "絶対成功させたいproject")
Project.find_or_create_by!(name: "失敗したら弊社が潰れるproject")

30.times{|i|PostWork.find_or_create_by!(project_id: "1", user_id: "2", name: "work#{i}", work: "test_work#{i}", area: "test_area#{i}", start_time: Time.current.since(i*2.days), end_time: Time.current.since(i*2.days))}


puts "seedの実行が完了しました"
