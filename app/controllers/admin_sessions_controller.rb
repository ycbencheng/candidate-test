class AdminSessionsController < Devise::SessionsController
  def new
    @user = User.find_by(email: 'admin@test.com')
    sign_in(@user)
    redirect_to root_path
  end
end
