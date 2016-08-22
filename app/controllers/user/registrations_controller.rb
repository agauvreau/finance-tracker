class User::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
    
    protected
    #this method is to push the last name and first name to the devise gem that manages the login and user login info.
     def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
     end
end