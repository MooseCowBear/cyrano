class Product < ApplicationRecord
  belongs_to :writer, class_name: "User"

  validates :title, length: {in: 2..50}
  validates :price, numericality: {only_integer: true, greater_than: 0} # selling products in whole dollar amounts...
  validates :description, length: {in: 2..500}

  # MARK: probably a product should have a decription but should it be required?
end
