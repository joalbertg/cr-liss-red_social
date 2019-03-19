# frozen_string_literal: true

# notificable
module Notificable
  extend ActiveSupport::Concern

  # methods that have to be executed with the class
  included do
    has_many :notifications, as: :item
  end

  def send_notification_to_users
    return unless respond_to?(:user_ids)

    # JOB send notifications async
    NotificationSenderJob.perform_later(id, self.class.name)
  end
end
