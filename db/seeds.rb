# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
8.times do |u|
    u += 1

    User.create(
        username: "user#{u}",
        email: "user1#{u}@opl.opl",
        password: '123456'
    )
    puts "#{u} users created"
end
=end

3.times do |f|
    f << 3

    Friendship.create(
        user_id: 2,
        friend_id: f
    )
    puts "#{f} friendships created"
end
