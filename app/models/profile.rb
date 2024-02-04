class Profile < ApplicationRecord
  belongs_to :user

  validates :username, uniqueness: true, length: {maximum: 50}
  validates :display_name, length: {maximum: 50}
  validates :about, length: {maximum: 3000}

  before_save :clean_username

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
end
