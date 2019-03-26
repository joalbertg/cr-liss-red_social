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

  scope :unviewed, -> { where(viewed: false) }
  scope :all_unviewed, ->(current_user) { where(user: current_user).unviewed }
  scope :find_id, ->(id) { find_by_id(id) }
  scope :latest, -> { order('created_at desc').limit(10) }

  def self.for_user(user_id)
    where(user_id: user_id).unviewed.count
  end
end
