class Agency < ApplicationRecord
  belongs_to :user
  has_one_attached :logo
  has_one_attached :banner
  #has_many :bands
end
