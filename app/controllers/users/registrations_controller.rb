class Users::RegistrationsController < Devise::RegistrationsController

  layout 'application'

  protected 
  def after_sign_up_path_for(resource)
    dashboard_path
  end


end