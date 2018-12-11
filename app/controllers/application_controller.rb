class ApplicationController < ActionController::Base

  protected
  def after_sign_in_path(resource)
    dashboard_path
  end

  def after_sign_up_path(resource)
    dashboard_path
  end

end
