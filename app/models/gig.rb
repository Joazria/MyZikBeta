class Gig < ApplicationRecord
  belongs_to :band
  validates :date, :gate_opening, :showtime, :duration, :local, :address, :state, :country, :website, :release, presence: true

end
