# frozen_string_literal: true

# service
class NotificationService
  def initialize(item, user_id)
    @notification = Notification.new(item: item, user_id: user_id)
  end

  def create_object
    return false unless @notification.save

    send_notification_to_broadcast_job
    true
  end

  def object
    @notification
  end

  def errors
    @notification.errors
  end

  class << self
    def generate_item(id, class_name)
      obj = item(id, class_name)
      obj.user_ids.each { |user_id| generate(user_id, obj) }
    end

    private

    def item(id, class_name)
      obj = to_class(class_name)
      return unless obj

      obj.find_by_id(id)
    end

    def generate(user_id, item)
      new(item, user_id).create_object
    end

    def to_class(class_name)
      # Post Friendship
      my_const = class_name.safe_constantize
      my_const.is_a?(Class) ? my_const : nil
    rescue NameError
      nil
    end
  end

  private

  def send_notification_to_broadcast_job
    NotificationBroadcastJob.perform_later(@notification.user_id)
  end
end
