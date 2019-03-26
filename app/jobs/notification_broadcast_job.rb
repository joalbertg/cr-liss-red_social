# frozen_string_literal: true

# broadcast
class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    ActionCable.server.broadcast "notifications.#{user_id}",
                                 action: 'new_notification',
                                 message: Notification.for_user(user_id)
  end
end
