class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :products, foreign_key: :writer_id, dependent: :destroy
  has_many :writing_samples, foreign_key: :writer_id, dependent: :destroy

  scope :writer, -> { where(writer: true) }
  scope :working, -> { where.associated(:profile) }

  def initial
    if profile
      profile.initial
    else
      email[0]
    end
  end

  def specialties
    if profile
      profile.specialties
    else
      []
    end
  end
end
