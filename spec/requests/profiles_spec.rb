require "rails_helper"

RSpec.describe "Profiles", type: :request do
  before do
    @user = create(:user)
    sign_in @user
  end

  describe "GET /new" do
    it "returns http success" do
      get "/profiles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid params" do
      it "returns http success" do
        expect {
          post profiles_path, params: {
            profile: { username: "test username", display_name: "" }
          }
        }.to change(Profile, :count).by(1)
      end
    end

    context "with invalid params" do
      it "renders new" do
        expect {
          post profiles_path, params: {
            profile: { display_name: "test display name" }
          }
        }.to change(Profile, :count).by(0)
      end
    end
  end

  describe "GET /edit" do
    before do
      @profile = create(:profile, user: @user, display_name: "test", username: "test")
    end

    it "returns http success" do
      get profile_path(@profile)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    before do
      @profile = create(:profile, user: @user, display_name: "test", username: "test")
    end

    context "with valid params" do
      it "returns http success" do
        patch profile_path(@profile), params: {
          profile: { display_name: "test update"}
        }
        @profile.reload
        expect(@profile.display_name).to eq "test update"
      end
    end

    context "with invalid params" do
      it "renders edit" do
        patch profile_path(@profile), params: {
          profile: { username: ""}
        }
        @profile.reload
        expect(@profile.username).to eq "test"
      end
    end

    context "when trying to update profile not belonging to user" do
      it "redirects to root" do
        profile = create(:profile)
        patch profile_path(profile), params: {
          profile: { username: ""}
        }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys profile owned by user" do
      profile = create(:profile, user: @user, display_name: "test", username: "test")
      expect {
        delete profile_path(profile)
      }.to change(Profile, :count).by(-1)
    end
  

    it "redirects to root if try to destroy profile not owned by user" do
      profile = create(:profile)
      expect {
        delete profile_path(profile)
      }.to change(Profile, :count).by(0)
      expect(response).to redirect_to(root_path)
    end
  end
end
