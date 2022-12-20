# frozen_string_literal: true

# class RecordsController
class RecordsController < ApplicationController
  before_action :require_user_logged_in!
  def edit
    @record = Record.find(params[:id])
  end

  def index
    @record = Record.all
  end

  def new
    @record = Record.new
  end

  def show
    @record = Record.find(params[:id])
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      RecordsCloseJob.set(wait: 300000.seconds).perform_later(@record)
      redirect_to @record
    else
      render 'new'
    end
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to @record
    else
      render 'edit'
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:title, :photo, :description, :status)
  end
end
