# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  include Notificable

  belongs_to :user

  scope :recent, -> { order('created_at desc') }

  def self.all_for_user(user)
    Post.where(user_id: user.id)
        .or(Post.where(user_id: user.friend_ids))
        .or(Post.where(user_id: user.user_ids))
  end

  def user_ids
    user.friend_ids + user.user_ids
  end
end
