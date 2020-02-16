class AdminsController < ApplicationController
  def index
    @users = User.all
    @users = policy_scope(@users)
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save!
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update(user_params)
      redirect_to users_admin_index_path
    else
      flash[:notice] =@user.errors.full_messages
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :editor, :admin)
  end
end
