require "rails_helper"

RSpec.describe WritingSample, type: :model do
  describe "valid attributes" do
    it "is valid when it has a body and 5 of fewer tags" do
      sample = build(:writing_sample, body: "something", tags: ["one", "two", "three", "four", "five"])
      expect(sample).to be_valid
    end
  end

  describe "invalid attributes" do
    it "is invalid without a body" do
      sample = build(:writing_sample, body: nil)
      expect(sample).not_to be_valid
    end

    it "is invalid with more than 5 tags" do
      sample = build(:writing_sample, tags: ["one", "two", "three", "four", "five", "six"])
      expect(sample).not_to be_valid
    end

    it "is invalid without a writer" do
      sample = build(:writing_sample, writer: nil)
      expect(sample).not_to be_valid
    end
  end
end
