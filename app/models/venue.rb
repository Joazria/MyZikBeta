class Venue < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
  has_many :bookings, as: :bookable

  acts_as_favoritable


  validates :venue_name, uniqueness: true
  validates :name, :release, :site,:photo, :fb, :insta, :line_up, :email, :tel, :address, presence: true

 include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [[ :venue_name , 'A']],
    using: {
      tsearch: { prefix: true }
    }
end
