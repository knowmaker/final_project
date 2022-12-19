require 'rails_helper'

RSpec.describe "Balances", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/balances/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
