class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
      before_action :configure_permitted_parameters, if: :devise_controller?
      # before_action :set_locale
      around_action :switch_locale
    
      protected
    
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :lastname, :firstname, :profession, :contact, :address])
      end
      rescue_from CanCan::AccessDenied do |exception|
        redirect_to new_user_session_path, notify:'Accès interdit'
      end
      
      # def set_locale
      #   I18n.locale = params[:locale] || I18n.default.locale
      # end

  
      def switch_locale(&action)
        locale = params[:locale] || I18n.default_locale
        I18n.with_locale(locale, &action)
      end 
  end