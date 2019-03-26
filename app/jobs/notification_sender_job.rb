# frozen_string_literal: true

# notification job
class NotificationSenderJob < ApplicationJob
  queue_as :notifications

  def perform(id, class_name)
    NotificationService.generate_item(id, class_name)
  end
end
