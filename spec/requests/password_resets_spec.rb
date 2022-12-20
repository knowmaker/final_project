require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/password_resets/edit"
      expect(response).to have_http_status 302
    end
  end

end
