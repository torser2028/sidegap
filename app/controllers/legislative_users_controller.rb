class LegislativeUsersController < ApplicationController
  def create
    @legislative_user = current_user.legislative_users.new(legislative_user_params)

    if @legislative_user.save
      redirect_to legislative_path(params[:legislative_user][:legislative_id]), notice: "Cambios guardados con éxito."
    end
  end

  def update
    @legislative_user = LegislativeUser.find(params[:id])

    if @legislative_user.update(legislative_user_params)
      redirect_to legislative_path(params[:legislative_user][:legislative_id]), notice: "Cambios guardados con éxito."
    end
  end

  private
    def legislative_user_params
      params.require(:legislative_user).permit(:impact, :comment, :legislative_id)
    end
end
