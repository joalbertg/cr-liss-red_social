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
  belongs_to :user
  scope :recent, -> { order('created_at desc') }
  after_create :send_to_action_cable

  def self.all_for_user(user)
    Post.where(user_id: user.id)
        .or(Post.where(user_id: user.friend_ids))
        .or(Post.where(user_id: user.user_ids))
  end

  private

  def send_to_action_cable
    data = { message: to_html, action: 'new_post' }

    user.friend_ids.each do |friend_id|
      ActionCable.server.broadcast 'some_channel', data
    end

    user.user_ids.each do |friend_id|
      ActionCable.server.broadcast 'some_channel', data
    end
  end

  def to_html
    ApplicationController.renderer.render(partial: 'posts/post',
                                          locals: { post: self })
    # locals: local variables used by the partial
  end
end
