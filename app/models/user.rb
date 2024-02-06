class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  def working?
    !!profile
  end

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
