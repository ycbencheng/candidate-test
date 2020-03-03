class ApplicationController < ActionController::Base
  include Pundit  
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
  private
 
    def user_not_authorized
      flash[:warning] = "You are not authorized to perform this action."
      if !current_user.present?
        redirect_to new_user_registration_path
      else
        redirect_to(request.referrer || root_path)
      end
    end
end
