class Admin::DashboardsController < ApplicationController
  layout 'admin'

  def index #管理者トップページ表示
  end

  def admin_guest #管理者ゲストログイン
    admin = Admin.find_or_create_by!(email: "admin_guest@example.com") do |admin|
      admin.password = "adminguest"
    end
    sign_in admin
    redirect_to admin_dashboards_index_path, notice: 'ログインしました。頑張り過ぎちゃだめですよ？'
  end

end
