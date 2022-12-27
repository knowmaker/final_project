# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeMailer, type: :mailer do
  describe 'congratulation' do
    let(:mail) { WelcomeMailer.welcome_email }
  end
end
