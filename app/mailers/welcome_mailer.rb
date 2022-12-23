# frozen_string_literal: true

# class WelcomeMailer
class WelcomeMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:3000/sign_in'
    mail(to: @user.email, subject: (t 'global.sub_welc'))
  end
end
