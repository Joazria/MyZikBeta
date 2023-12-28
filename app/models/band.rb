class Band < ApplicationRecord
  belongs_to :user
  has_many :gigs
  has_many :offers
  #belongs_to :agency

  has_many :bookings

  has_one_attached :photo

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  validates :name, uniqueness: true
  validates :name,
            :email,
            :genero1,
            :website,
            :facebook,
            :instagram,
            :youtube,
            :spotify,
            :city,
            :state,
            :headline,
            :yt_video_destak,
            :yt_video_one,
            :yt_video_two,
            :release,
            :country, presence: true

  validates :website, format: { with: /((w{3}\.)|(https?:\/\/))?[a-zA-Z]+\.[a-zA-Z]*\.?[a-zA-Z]*\/?(.?)*/, message: "Must be a valid website" }

  validates :email, format: { with: /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/, message: "Must be a valid email" }
  validates :team, presence: true, numericality: { only_integer: true }

 include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [[ :name , 'A']],
    using: {
      tsearch: { prefix: true }
    }

 before_create :regex_link

  private

  def regex_link
    if self.yt_video_destak.include?('youtube')
      matchdata = yt_video_destak.match(/=(?<video>.+)/)
      self.yt_video_destak = "https://www.youtube.com/embed/#{matchdata[:video]}"
    else
      matchdata = yt_video_destak.match(/\/(?<video>[0-9]+)/)
      self.yt_video_destak = "https://player.vimeo.com/video/#{matchdata[:video]}"
    end

    if self.yt_video_one.include?('youtube')
      matchdata = yt_video_one.match(/=(?<video>.+)/)
      self.yt_video_one = "https://www.youtube.com/embed/#{matchdata[:video]}"
    else
      matchdata = yt_video_one.match(/\/(?<video>[0-9]+)/)
      self.yt_video_one = "https://player.vimeo.com/video/#{matchdata[:video]}"
    end

    if self.yt_video_two.include?('youtube')
      matchdata = yt_video_two.match(/=(?<video>.+)/)
      self.yt_video_two = "https://www.youtube.com/embed/#{matchdata[:video]}"
    else
      matchdata = yt_video_two.match(/\/(?<video>[0-9]+)/)
      self.yt_video_two = "https://player.vimeo.com/video/#{matchdata[:video]}"
    end

    if self.yt_video_three.include?('youtube')
      matchdata = yt_video_three.match(/=(?<video>.+)/)
      self.yt_video_three = "https://www.youtube.com/embed/#{matchdata[:video]}"
    else
      matchdata = yt_video_three.match(/\/(?<video>[0-9]+)/)
      self.yt_video_three = "https://player.vimeo.com/video/#{matchdata[:video]}"
    end
  end
end
