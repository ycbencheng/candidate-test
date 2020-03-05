class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :authenticate_user!, :redirect_unless_admin
  before_action :redirect_unless_admin_or_guest

  # skip_before_action :require_no_authentication

  def new
    super
  end
  
  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # if session[:user_id] == nil? 
      #   current_user = @user 
      # else
      #   session[:user_id] = current_user.id
      # end
      
      redirect_to users_path
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
      redirect_to create_new_user_path
    end
  end

  private

  def redirect_unless_admin
    unless current_user.role == 'admin'
      flash[:error] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  def redirect_unless_admin_or_guest
    unless current_user.nil? || current_user.role == 'admin'
      flash[:error] = "Only admin or guest can do that"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :role, :password)
  end

  def admin_or_guest
  end

end
