module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    def devise_parameter_sanitizer
      if resource_class == User
        User::ParameterSanitizer.new(User, :user, params)
      else
        super
      end
    end

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up)
    end

    def account_update_params
      devise_parameter_sanitizer.sanitize(:account_update)
    end
  end
end
