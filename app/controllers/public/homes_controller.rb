class Public::HomesController < ApplicationController
  
  def top #トップページを表示
  end

  def new_guest #ゲストログイン（メールアドレス、パスワードを入力せずに簡単ログイン）
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.team = "ゲストチーム"
      user.name = "ゲストユーザー"
      user.telephone_number = "09012345678"
      user.password = "SecureRandom.urlsafe_base64"
    end
    sign_in user
    redirect_to projects_path, notice: 'ログインしました。頑張り過ぎちゃだめですよ？'
  end
end
