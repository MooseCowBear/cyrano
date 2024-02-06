require "rails_helper"

RSpec.describe "Dashboards", type: :request do
  # TODO: once have client dashboard -- check for correst partial being rendered depending on type of user
  before do
    @user = create(:user)
    sign_in @user
  end

  describe "GET /dashboard" do
    it "returns http success" do
      get "/dashboard"
      expect(response).to have_http_status(:success)
    end
  end
end
