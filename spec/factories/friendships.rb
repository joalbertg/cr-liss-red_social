# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer          not null
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :friendship do
    association :user, factory: :user
    association :friend, factory: :user
    status { "MyString" }
  end
end
