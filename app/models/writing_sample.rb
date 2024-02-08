class WritingSample < ApplicationRecord
  belongs_to :writer, class_name: "User"

  validates :body, presence: true
  validates :tags, length: {maximum: 5, too_long: "is too long (5 is the maximum allowed)"}

  serialize :tags, Array

  scope :selected, -> { where(selected: true) }

  # so can keep one confirm ownership method
  def user
    writer
  end
end
