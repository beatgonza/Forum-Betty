class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery

  def admin_required
    unless current_user && (current_user.permission_level == 1 || current_user.id == 1)
      redirect_to '/'
    end
  end

  def admin_or_owner_required(id)
    unless current_user.id == id || current_user.permission_level == 1 || current_user.id == 1
      redirect_to '/'
    end
  end

end
