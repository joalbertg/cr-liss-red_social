# frozen_string_literal: true

# notificable
module Notificable
  extend ActiveSupport::Concern

  # methods that have to be executed with the class
  included do
    has_many :notifications, as: :item
    after_create :send_notification_to_users
  end

  def send_notification_to_users
    
  end
end
