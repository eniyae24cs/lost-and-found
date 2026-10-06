
class ApplicationController < ActionController::Base

  helper_method :current_admin

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
  end

  def require_admin
    unless current_admin
      redirect_to admin_login_path, alert: "Please login as admin first!"
    end
  end

end

