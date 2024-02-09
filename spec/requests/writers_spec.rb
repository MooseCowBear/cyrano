require "rails_helper"

RSpec.describe "Writers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/writers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/writers/show"
      expect(response).to have_http_status(:success)
    end
  end
end
