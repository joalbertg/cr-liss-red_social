# frozen_string_literal: true

# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_type  :string
#  item_id    :integer
#  viewed     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# notification
class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :item, polymorphic: true
  after_create { NotificationBroadcastJob.perform_later(self) }
  scope :unviewed, -> { where(viewed: false) }

  def self.for_users(user_id)
    where(user_id: user_id).unviewed.count
  end
end
