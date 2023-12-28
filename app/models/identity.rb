class Identity < ApplicationRecord

  belongs_to :user
  has_one_attached :avatar


  #validates :release, :whatsapp, :country, :state, :city, presence: true

end
