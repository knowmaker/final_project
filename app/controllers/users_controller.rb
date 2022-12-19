# frozen_string_literal: true

# class UsersController
class UsersController < ApplicationController
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

  # def balances
  #   #@user = User.find(params[:id])
  #     if @user.update(user_params)
  #       redirect_to @user
  #     else
  #       render 'balances'
  #     end
  #   end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :balance)
  end
end
