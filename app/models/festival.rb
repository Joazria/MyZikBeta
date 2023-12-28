class Festival < ApplicationRecord
  belongs_to :user
  # has_many :bookings
  has_many :booking, as: :bookable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
# reverse_geocoded_by :lat, :lon do |obj,results|
#   if geo = results.first
#     obj.city    = geo.city
#     obj.zipcode = geo.postal_code
#     obj.country = geo.country_code
#   end
# end
# after_validation :reverse_geocode

  has_one_attached :photo

  acts_as_favoritable


  #validates :festival_name, uniqueness: true
  validates :name, :genero1, :youtube, :release, :photo, :site, :fb, :insta, :periode_start, :periode_end, :line_up, :email, :tel, :address, presence: true

 include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [[ :festival_name , 'A']],
    using: {
      tsearch: { prefix: true }
    }


  before_create :regex_link

  private

  def regex_link
    if self.youtube.include?('youtube')
      matchdata = youtube.match(/=(?<video>.+)/)
      self.youtube = "https://www.youtube.com/embed/#{matchdata[:video]}"
    else
      matchdata = youtube.match(/\/(?<video>[0-9]+)/)
      self.youtube = "https://player.vimeo.com/video/#{matchdata[:video]}"
    end
  end
end
