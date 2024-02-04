class Profile < ApplicationRecord
  belongs_to :user

  validates :username, presence: true, uniqueness: true, length: {in: 1..50}
  validates :display_name, length: {in: 1..50}, allow_blank: true
  validates :about, length: {maximum: 3000}

  before_save :clean_username
  before_save :clean_display_name

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
