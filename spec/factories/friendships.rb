# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend     :integer          not null
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :friendship do
    user { nil }
    friend { 1 }
    status { "MyString" }
  end
end
