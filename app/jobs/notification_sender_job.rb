# frozen_string_literal: true

# notification job
class NotificationSenderJob < ApplicationJob
  queue_as :notifications

  def perform(id, class_name)
    obj = item(id, class_name)
    obj.user_ids.each { |user_id| generate(user_id, obj) }
  end

  private

  def generate(user_id, item)
    NotificationService.new(item, user_id).create_object
  end

  def item(id, class_name)
    return Post.find_by_id(id) if class_name == 'Post'

    Friendship.find_by_id(id)
  end
end
