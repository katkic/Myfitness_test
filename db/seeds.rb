# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'taro', email: 'taro@test.com', password: 'kawaiitaro')
User.create!(name: 'jiro', email: 'jiro@test.com', password: 'kawaiijiro')
User.create!(name: 'saburo', email: 'saburo@test.com', password: 'kawaiiwaburo')
User.create!(name: 'shiro', email: 'shiro@test.com', password: 'kawaiishiro')
User.create!(name: 'goro', email: 'goro@test.com', password: 'kawaiigoro')

Profile.create!(user_id: 3)
Profile.create!(user_id: 4)
Profile.create!(user_id: 5)
Profile.create!(user_id: 6)
Profile.create!(user_id: 7)

User.create!(name: 'rokuro', email: 'rokuro@test.com', password: 'kawaiirokuro')
Profile.create!(user_id: 8, self_introduction: 'こんにちは、六郎です。よろしくお願いします')


