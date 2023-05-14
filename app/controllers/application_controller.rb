class ApplicationController < ActionController::Base

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    admin_dashboards_path
  end
  
  def after_update_path_for(resource)
    admin_dashboards_path
  end

end
