class Public::HomesController < ApplicationController
  def top
  end

  def new_guest
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.team = "ゲストチーム"
      user.name = "ゲストユーザー"
      user.telephone_number = "09012345678"
      user.password = "SecureRandom.urlsafe_base64"
    end
    sign_in user
    redirect_to projects_path, notice: 'ログインしました。お仕事がんばってください。無理しちゃいけませんよ？'
  end
end
