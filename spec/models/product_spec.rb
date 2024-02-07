require "rails_helper"

RSpec.describe Product, type: :model do
  describe "validations" do
    it "is invalid without title" do
      product = build(:product, title: nil)
      expect(product).not_to be_valid
    end

    it "is invalid with title < 2 chars" do
      product = build(:product, title: "a")
      expect(product).not_to be_valid
    end

    it "is invalid with title > 50 chars" do
      product = build(:product, title: "a" * 51)
      expect(product).not_to be_valid
    end

    it "is invalid without description" do
      product = build(:product, description: nil)
      expect(product).not_to be_valid
    end

    it "is invalid with description < 2 chars" do
      product = build(:product, description: "")
      expect(product).not_to be_valid
    end

    it "is invalid with description > 500 chars" do
      product = build(:product, description: "a" * 501)
      expect(product).not_to be_valid
    end

    it "is invalid without price" do
      product = build(:product, price: nil)
      expect(product).not_to be_valid
    end

    it "is invalid if price not integer" do
      product = build(:product, price: "not number")
      expect(product).not_to be_valid
    end

    it "is invalid with price not greater than 0" do
      product = build(:product, price: 0)
      expect(product).not_to be_valid
    end

    it "is valid with title in range, description in range, positive integer price" do
      product = build(:product, title: "something", description: "something", price: 5)
      expect(product).to be_valid
    end
  end
end
