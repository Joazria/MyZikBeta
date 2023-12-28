class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :band

  validates :event_name,
            :local,
            :date,
            :show_time,
            :release,
            :line_up,
            :fee,
            :format,
            :patrocino,
            :address,
            :transport,
            :perdiem,
            :backline,
            :accommodation,
            :capacity,
            :link_do_event,
            :streaming,
            :ticket,
            presence: true
end
