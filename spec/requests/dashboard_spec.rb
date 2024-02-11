require "rails_helper"

RSpec.describe "Dashboards", type: :request do
  # TODO: FINISH THIS

  describe "GET /dashboard" do
    context "user is a writer" do
      before do
        @user = create(:user)
        sign_in @user
      end

      it "returns http success" do
        get "/dashboard"
        expect(response).to have_http_status(:success)
      end

      it "renders the writer's dashboard" do
      end
    end

    context "user is a client" do
      it "returns http success" do
        get "/dashboard"
        expect(response).to have_http_status(:success)
      end

      it "renders the client's dashboard" do
      end
    end

    context "user is not signed in" do
      it "redirects to root" do
      end
    end
  end
end
