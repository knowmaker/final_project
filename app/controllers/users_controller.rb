# frozen_string_literal: true

# class UsersController
class UsersController < ApplicationController
  before_action :require_user_logged_in!, only: %i[edit update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      WelcomeMailer.with(user: @user).welcome_email.deliver_now
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if (balance_params[:balance]).to_i<0
      redirect_to edit_balance_path, notice: 'Not corrected'
      return
    end
    Current.user.balance+=(balance_params[:balance]).to_i
    if Current.user.save
      redirect_to edit_balance_path, notice: 'Balance Updated'
    else
      render 'edit'
    end
  end

  private

  def balance_params
    params.require(:user).permit(:balance)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
