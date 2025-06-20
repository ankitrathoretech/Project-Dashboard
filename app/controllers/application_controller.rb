class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  #
  before_action :configure_permitted_parameters, if: :devise_controller?

  allow_browser versions: :modern

  protected

  def configure_permitted_parameters
    # For sign in
    devise_parameter_sanitizer.permit(:sign_in, keys: [ :username ])
    # For sign up (if needed later)
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username, :salt ])
  end
end
