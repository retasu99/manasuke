class ApplicationController < ActionController::Base

  before_action :configure_authentication #アクションの実行前に、エンドユーザーもしくは管理者としてログインしているか確認
  private

  def configure_authentication #実行するコントローラとアクションが、publicかadminかに基づいて認証メソッドを呼び出す
    if admin_controller?
      authenticate_admin! unless action_is_admin?
    else
      authenticate_user! unless action_is_public?
    end
  end

  def admin_controller? #現在のコントローラがadmin名前空間下にあるかどうか判断
    self.class.module_parent_name == 'Admin'
  end

  def action_is_public? #public名前空間内にて認証が不要なコントローラとアクションを指定
    controller_name == 'homes' && action_name == 'top' || action_name == 'new_guest'
  end

  def action_is_admin? #admin名前空間内にて認証が不要なコントローラとアクションを指定
    controller_name == 'dashboards' && action_name == 'admin_guest'
  end

end
