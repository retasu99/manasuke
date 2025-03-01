class Admin::UsersController < ApplicationController
  layout 'admin'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを退会させました。'
  end

end
