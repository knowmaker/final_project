# frozen_string_literal: true

# class ApplicationController
class ApplicationController < ActionController::Base
  before_action :set_current_user
  around_action :switch_locale
  def set_current_user
    # finds user with session data and stores it if present
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    @is_admin = Current.user.email == 'admin@admin.admin' if Current.user
  end

  def require_user_logged_in!
    # allows only logged in user
    redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
  end

  def switch_locale(&action)
    locale = locale_from_url || I18n.default_locale
    I18n.with_locale locale, &action
  end
  def locale_from_url
    locale = params[:locale]
    return locale if I18n.available_locales.map(&:to_s).include?(locale)
    nil
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
