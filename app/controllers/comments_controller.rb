# frozen_string_literal: true

# class CommentsController
class CommentsController < ApplicationController
  def create
    @record = Record.find(params[:record_id])
    @comment = @record.comments.create(comment_params)
    redirect_to record_path(@record)
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :cost)
  end
end
