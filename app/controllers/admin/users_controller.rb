class Admin::UsersController < ApplicationController
  layout 'admin'

  def index #ユーザー一覧を表示
    @users = User.all
  end

  def show #ユーザーの詳細を表示
    @user = User.find(params[:id])
  end

  def destroy #ユーザーを退会させる
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを退会させました。'
  end

end
