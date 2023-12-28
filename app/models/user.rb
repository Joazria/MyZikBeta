class User < ApplicationRecord
  has_many :bands
  has_many :festivals
  has_many :infos
  has_one :identity
  has_many :bookings
  has_one :agency

  acts_as_favoritor

   has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable, :omniauthable,
  :recoverable, :rememberable, :validatable, omniauth_providers: [:google_oauth2]


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(first_name: data['first_name'],
         last_name: data['last_name'],
         avatar: data['image'],
         email: data['email'],
         password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
