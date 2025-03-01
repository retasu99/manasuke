class Admin::DashboardsController < ApplicationController
  layout 'admin'

  def index
  end

  def admin_guest
    admin = Admin.find_or_create_by!(email: "admin_guest@example.com") do |admin|
      admin.password = "adminguest"
    end
    sign_in admin
    redirect_to admin_dashboards_index_path, notice: 'ログインしました。お仕事がんばってください。無理しちゃいけませんよ？'
  end

end
