# frozen_string_literal: true

# routes
class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all_unviewed(current_user).latest

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @notification = Notification.find_id(params[:id])
    redirect_to :back, notice: message
  end

  private

  def notification_params
    params.require(:notification).permit(:viewed)
  end

  def message
    return 'Notificación vista' if @notification.update(notification_params)

    'Hubo un error'
  end
end
