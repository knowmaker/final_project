class BalancesController < ApplicationController
  before_action :require_user_logged_in!
  def edit; end
  def update
    # update user password
    if Current.user.update(balance_params)
      redirect_to root_path, notice: 'Password Updated'
    else
      #render json: Current.user.errors
      render 'edit'
    end
  end
  private
  def balance_params
    params.require(:user).permit(:balance)
  end
end
