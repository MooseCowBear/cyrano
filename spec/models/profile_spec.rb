require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'valid attributes' do
    it 'is valid when it has a unique username' do
      profile = build(:profile)
      expect(profile).to be_valid
    end

    it 'is invalid when username has been taken' do
      profile1 = create(:profile)
      profile2 = build(:profile)
      expect(profile2).not_to be_valid
    end

    it 'strips white space from username before save' do
      profile = create(:profile, username: "   extra spaces   ")
      profile.reload
      expect(profile.username).to eq "extra spaces"
    end

    it 'lowercases username before save' do
      test_username = "CAPITALIZED"
      profile = create(:profile, username: test_username)
      profile.reload
      expect(profile.username).to eq test_username.downcase
    end
  end
end
