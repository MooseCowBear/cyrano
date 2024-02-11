require "rails_helper"

RSpec.describe "WritingSamples", type: :request do
  # FINISH once finished with writing samples controller/views
  describe "GET /index" do
    it "returns http success" do
      get "/writing_samples/index"
      expect(response).to have_http_status(:success)
    end

    context "When 'All' is selected" do
      it "displays all of writer's writing samples" do
      end
    end

    context "when 'Selected' is selected" do
      it "displays only selected writing samples" do
      end
    end
  end

  describe "GET /show" do
    it "redirects if sample does not belong to user" do
    end

    it "returns http success" do
      get "/writing_samples/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/writing_samples/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "redirects if sample does not belong to user" do
    end

    context "with valid attributes" do
      it "creates a new sample" do
      end
    end

    context "with invalid attributes" do
      it "does not create a new sample" do
      end
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/writing_samples/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    it "redirects if writing sample does not belong to user" do
    end

    context "with valid attributes" do
      it "updates sample" do
      end
    end

    context "with invalid attributes" do
      it "updates sample" do
      end
    end
  end

  describe "DELETE /destroy" do
    it "redirects when sample does not belong to user" do
    end

    
  end
end
