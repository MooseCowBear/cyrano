require "rails_helper"

RSpec.describe "Products", type: :request do
  # TODO: needs to be finished
  describe "GET /writers/:writer_id/products" do
    it "returns http success" do
      get "/products/index"
      expect(response).to have_http_status(:success)
    end

    it "returns products from writer" do
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/products/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid attributes" do
    end

    context "with invalid attributes" do
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/products/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    context "with valid attributes" do
    end

    context "with invalid attributes" do
    end
  end

  describe "GET /show" do
    it "redirects if product does not belong to user" do
    end

    it "returns http success" do
      get "/products/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    it "redirects if product does not belong to user" do
    end


  end
end
