class ApplicationController < ActionController::Base
  # want to redirect to dashboard IF user was on the root path
  # otherwise, want to redirect to the location they were on when they were prompted to sign in
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!

  def confirm_ownership(elem, message)
    if elem.user != current_user
      flash[:alert] = message
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:writer])
  end

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    if request.fullpath == root_path
      store_location_for(:user, dashboard_path)
    else
      store_location_for(:user, request.fullpath)
    end
  end
end
