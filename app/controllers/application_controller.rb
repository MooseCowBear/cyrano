class ApplicationController < ActionController::Base
  # want to redirect to dashboard IF user was on the root path
  # otherwise, want to redirect to the location they were on when they were prompted to sign in

  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!

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
