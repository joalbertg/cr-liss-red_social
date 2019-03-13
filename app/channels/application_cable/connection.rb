# frozen_string_literal: true

module ApplicationCable
  # connection cable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
    end

    def find_user
      user_id = cookies.signed['user.id']
      current_user = User.find_by_id(user_id)

      return current_user if current_user

      reject_unauthorized_connecction
    end
  end
end
