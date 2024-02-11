require "rails_helper"

RSpec.describe "Writers", type: :request do
  # FINISH once have writers index

  describe "GET /index" do
    it "returns http success" do
      get "/writers/index"
      expect(response).to have_http_status(:success)
    end

    it "displays working writers" do
    end

    it "does not display non-working writers" do
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/writers/show"
      expect(response).to have_http_status(:success)
    end

    it "includes the user's display name" do
    end

    it "includes the user's about" do
    end

    it "includes user's selected writing samples" do
    end

    it "does not include user's non-selected writing samples" do
    end
  end
end
