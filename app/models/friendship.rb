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

class Friendship < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :friend, class_name: 'User' # name of the class with which the relationship is mapped

  validates :user_id, uniqueness: { scope: :friend_id, message: 'Duplicate friendship' }

  aasm column: "status" do
    state :pending, initial: true
    state :active
    state :denied

    event :accepted do # transition between states
      transitions from: [:pending], to: [:active]
    end

    event :rejected do # transition between states
      transitions from: [:pending, :active], to: [:denied]
    end
  end

  def self.friends?(user, friend)
    return true if (user == friend)
    where(user: user, friend: friend)
    .or(where(user: friend, friend: user))
    .any? # .count > 0
  end

  def self.pending_for_user(user)
    Friendship.pending.where(friend: user)
  end
end
