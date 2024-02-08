class Profile < ApplicationRecord
  belongs_to :user

  validates :username, presence: true, uniqueness: true, length: {in: 1..50}
  validates :display_name, length: {in: 1..50}, allow_blank: true
  validates :about, length: {maximum: 3000}
  validates :specialties, length: {maximum: 5, too_long: "is too long (5 is the maximum allowed)"}

  before_validation :clean_username
  before_validation :clean_display_name

  serialize :specialties, Array

  def initial
    if display_name
      display_name[0]
    else
      username[0]
    end
  end

  private

  def clean_username
    self.username = username.downcase.strip
  end

  def clean_display_name
    self.display_name = nil if display_name.empty?
  end
end
