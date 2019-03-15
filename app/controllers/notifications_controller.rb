# frozen_string_literal: true

# routes
class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all_unviewed(current_user)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
