# frozen_string_literal: true

# class UsersController
class UsersController < ApplicationController
  before_action :require_user_logged_in!, only: [:edit,:update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_later
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render 'new'
    end
  end
  def edit; end
  def update
    # update user password
    if Current.user.update(balance_params)
      redirect_to edit_balance_path, notice: 'Password Updated'
    else
      #render json: Current.user.errors
      render 'edit'
    end
  end

  private
  def balance_params
    params.require(:user).permit(:balance)
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :balance)
  end
end
