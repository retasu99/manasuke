class Public::UsersController < ApplicationController #ユーザー関係のアクション
  before_action :is_matching_login_user, only: [:edit, :update] #edit・updateアクション実行前に、そのユーザーとログイン中のユーザーが同じか判断

  def index #ユーザー一覧ページを表示
    @users = User.all
  end

  def show #ユーザー詳細ページを表示
    @user = User.find(params[:id])
    @post_works = @user.post_works
  end

  def edit #ユーザー情報の編集ページを表示
    @user = User.find(params[:id])
  end

  def update #編集したユーザー情報を保存
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy #退会処理（ユーザー情報の削除）
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "退会しました。"
    redirect_to :root
  end

  def acknowledged_users #特定の投稿へ承認（いいね）したユーザー情報を取り出す
    @post_work = PostWork.find(params[:id])
    @acknowledgements = Acknowledgement.all
  end

  def following_users #自分がフォローしているユーザー情報を取り出す
    @user = User.find(params[:id])
  end

  def followers #自分をフォローしているユーザー情報を取り出す
    @user = User.find(params[:id])
  end

  private

  def user_params #保存されているユーザー情報を要求する
    params.require(:user).permit(:name, :team, :telephone_number, :email)
  end

  def is_matching_login_user #そのユーザーとログイン中のユーザーが等しいか判断、もし異なればプロジェクト一覧ページへ遷移
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to projects_path
    end
  end
  
end
