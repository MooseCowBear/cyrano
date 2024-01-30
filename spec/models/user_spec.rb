require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  describe ".writer?" do
    it "returns true if user has a profile" do
      create(:profile, user: @user)
      expect(@user.writer?).to be true
    end

    it "returns false if user has no profile" do
      expect(@user.writer?).to be false
    end
  end
end
