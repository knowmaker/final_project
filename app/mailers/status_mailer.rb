# frozen_string_literal: true

# class StatusMailer
class StatusMailer < ApplicationMailer
  def congratulation
    @maxuser = params[:record].comments.select(:username).order(cost: :desc, created_at: :asc).first.username
    @maxuser_cost = params[:record].comments.where(username: @maxuser).first.cost
    @us_name = User.find_by(email: @maxuser).name
    @rec_name = params[:record].title

    mail(to: @maxuser, subject: (t 'global.sub_cong'))
  end
end
