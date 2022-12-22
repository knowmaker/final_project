# frozen_string_literal: true

# class SessionsController
class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: (t '.log_suc')
    else
      flash.now[:alert] = t '.log_err'
      render 'new'
    end
  end

  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: (t '.log_out')
  end
end
