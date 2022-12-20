# frozen_string_literal: true

# class CommentsController
class CommentsController < ApplicationController
  def create
    @record = Record.find(params[:record_id])
    @comment = @record.comments.create(username: Current.user.email, cost: comment_params[:cost])
    Current.user.balance-=(comment_params[:cost]).to_i
    Current.user.save
    redirect_to record_path(@record)
  end

  private

  def comment_params
    params.require(:comment).permit(:cost)
  end
end
