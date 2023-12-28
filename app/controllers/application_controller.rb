class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :record_last_seen_at
  protect_from_forgery with: :null_session

 protected


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :username])

    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :username])


  end

def after_sign_in_path_for(resource)
  profile_path(current_user)
end

 def after_sign_up_path_for(resource)
   stored_location_for(resource) || welcome_path
   # <- Path you want to redirect the user to.
  end

  def record_last_seen_at
    if current_user
      current_user.touch :last_seen_at
    end
  end
end
