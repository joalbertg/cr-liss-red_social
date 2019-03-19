# frozen_string_literal: true

# service
class NotificationService
  def initialize(item, user_id)
    @notification = Notification.new(item: item, user_id: user_id)
  end

  def create_object
    if @notification.save
      send_notification_to_broadcast_job
      return true
    end
    false
  end

  def object
    @notification
  end

  def errors
    @notification.errors
  end

  private

  def send_notification_to_broadcast_job
    NotificationBroadcastJob.perform_later(@notification.user_id)
  end
end
