class Profile < ApplicationRecord
  belongs_to :user

  validates :username, uniqueness: true, length: {maximum: 50}
  validates :display_name, length: {maximum: 50}

  before_save :clean_username

  private

  def clean_username
    self.username = username.downcase.strip
  end
end
