class NotificationsController < ApplicationController
  before_action :authenticate_user!

    def index
      @notifications = current_user.passive_notifications.page(params[:page]).per(3)
      @notifications.where(checked: false).each do |notification|
        notification.update(checked: true)
    end
    end
end