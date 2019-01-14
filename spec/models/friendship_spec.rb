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

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it { should belong_to(:user) } 
  it { should belong_to(:friend) } 

  it "should validate uniqueness of user with friend" do
    user = FactoryBot.create(:user)
    friend = FactoryBot.create(:user)

    FactoryBot.create(:friendship, user: user, friend: friend)
    
    duplicate_friendship = FactoryBot.build(:friendship, user: user, friend: friend)

    expect(duplicate_friendship.valid?).to be_falsy
  end
end
