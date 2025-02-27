class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end

  def destroy
    @notifications = current_user.notifications.destroy_all
    redirect_to notifications_path
  end
end
