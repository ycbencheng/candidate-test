class Users::RegistrationsController < Devise::RegistrationsController
  before_action :redirect_unless_admin_or_guest

  def new
    super
  end
  
  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)   
      redirect_to articles_path
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
      redirect_to new_user_registration_path
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
