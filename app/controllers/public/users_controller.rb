class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_works = @user.post_works
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "Canceled your membership successfully."
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:name, :team, :telephone_number, :email)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to projects_path
    end
  end
  
end
