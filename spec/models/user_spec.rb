require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  describe "#working?" do
    it "returns true if user has a profile" do
      create(:profile, user: @user)
      expect(@user.working?).to be true
    end

    it "returns false if user has no profile" do
      expect(@user.working?).to be false
    end
  end

  describe "#initial" do
    it "returns profile initial if user has profile" do
      create(:profile, user: @user, display_name: "display")
      expect(@user.initial).to eq "d"
    end

    it "returns first letter of email if user has no profile" do
      expect(@user.initial).to eq "p"
    end
  end

  describe "#specialties" do
    it "returns profile specialties if user has a profile" do
      create(:profile, :with_specialties, user: @user)
      expected = ["one", "two"]
      @user.specialties.each_with_index do |s, index|
        expect(s).to eq expected[index]
      end
    end

    it "returns empty array if user has no profile" do
      expect(@user.specialties).to eq []
    end
  end
end
