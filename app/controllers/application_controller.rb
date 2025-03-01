class ApplicationController < ActionController::Base

  before_action :configure_authentication
  private

  def configure_authentication
    if admin_controller?
      authenticate_admin! unless action_is_admin?
    else
      authenticate_user! unless action_is_public?
    end
  end

  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  def action_is_public?
    controller_name == 'homes' && action_name == 'top' || action_name == 'new_guest'
  end

  def action_is_admin?
    controller_name == 'dashboards' && action_name == 'admin_guest'
  end

end
