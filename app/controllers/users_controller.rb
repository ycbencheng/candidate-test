class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    @user.update(user_params)
    redirect_to users_path
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :role, :password)
  end

end