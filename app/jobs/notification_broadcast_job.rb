# frozen_string_literal: true

# broadcast
class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notificaton)
    id = notificaton.user_id
    ActionCable.server.broadcast "notifications.#{id}",
                                 action: 'new_notification',
                                 message: Notification.for_users(id)
  end
end
