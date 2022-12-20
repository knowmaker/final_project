# frozen_string_literal: true

# class ApplicationController
class ApplicationController < ActionController::Base
  before_action :set_current_user
  def set_current_user
    # finds user with session data and stores it if present
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    if Current.user
      @is_admin = Current.user.email=='admin@admin.admin'
    end
  end

  def require_user_logged_in!
    # allows only logged in user
    redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
  end
end
