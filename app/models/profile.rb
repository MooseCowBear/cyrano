class Profile < ApplicationRecord
  belongs_to :user

  validates :username, uniqueness: true

  before_save :clean_username

  private 

  def clean_username
    self.username = username.downcase.strip
  end
end
