class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    search = Geocoder.search(@user.current_sign_in_ip.to_s)
    date = Date.today
    log = SessionLog.where(email: @user.email, ip_address: @user.current_sign_in_ip.to_s, created_at: date.beginning_of_day..date.end_of_day).last
    unless log.present?
      coordinates = search.present? ? search.first.coordinates : ''
      location = search.present? ? "#{search.first.city} - #{search.first.region} - #{search.first.country}" : ''
      log = SessionLog.new(email: @user.email, ip_address: @user.current_sign_in_ip.to_s, location: location, coordinates: coordinates, daily_sing_in_count: 1)
    else
      count = log.daily_sing_in_count.to_i + 1
      log.daily_sing_in_count = count
    end
    log.save
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
