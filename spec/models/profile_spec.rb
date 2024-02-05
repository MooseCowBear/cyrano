require "rails_helper"

RSpec.describe Profile, type: :model do
  describe "valid attributes" do
    it "is valid when it has a unique username under 50 chars" do
      profile = build(:profile)
      expect(profile).to be_valid
    end
  end

  describe "invalid attributes" do
    it "is invalid when username has been taken" do
      create(:profile)
      profile2 = build(:profile)
      expect(profile2).not_to be_valid
    end

    it "is invalid when username is more than 50 chars" do
      profile = build(:profile, username: "a" * 51)
      expect(profile).not_to be_valid
    end

    it "in invalid when display name is more than 50 chars" do
      profile = build(:profile, display_name: "a" * 51)
      expect(profile).not_to be_valid
    end

    it "is invalid when description is more than 3000 chars" do
      profile = build(:profile, about: "a" * 3001)
      expect(profile).not_to be_valid
    end
  end

  describe "before action" do
    it "strips white space from username before save" do
      profile = create(:profile, username: "   extra spaces   ")
      profile.reload
      expect(profile.username).to eq "extra spaces"
    end

    it "lowercases username before save" do
      test_username = "CAPITALIZED"
      profile = create(:profile, username: test_username)
      profile.reload
      expect(profile.username).to eq test_username.downcase
    end
  end

  describe "#initial" do
    it "returns the first char of username name if no display name" do
      profile = build(:profile, username: "Olive", display_name: nil)
      expect(profile.initial).to eq "O"
    end

    it "returns the first char of display name if present" do
      profile = build(:profile, display_name: "Molly")
      expect(profile.initial).to eq "M"
    end
  end
end
