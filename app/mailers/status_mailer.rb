class StatusMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.status_mailer.congratulation.subject
  #
  def congratulation
    @maxuser = params[:record].comments.select(:username).order(cost: :desc, created_at: :asc).first.username
    @maxuser_cost = params[:record].comments.where(username: @maxuser).first.cost
    @us_name = User.find_by(email: @maxuser).name
    @rec_name = params[:record].title

    mail(to: @maxuser, subject: (t 'global.sub_cong'))
  end
end
