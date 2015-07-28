class UserNotificationsController < ApplicationController
  def create
    ids = params[:user_notifications][:institution_ids].reject(&:blank?)
    current_user.user_notifications.destroy_all
    ids.each { |id| current_user.user_notifications.create(institution_id: id) }
    redirect_to :back, notice: "Notificaciones guardadas con éxito."
  end
end
