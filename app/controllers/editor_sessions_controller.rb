class EditorSessionsController < Devise::SessionsController
  def new
    @user = User.find_by(email: 'editor1@test.com')
    sign_in(@user)
    redirect_to root_path
  end
end
