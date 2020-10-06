class Concert < ApplicationRecord
  belongs_to :band
  belongs_to :venue
  validates :date, :venue_id, :band_id, presence: :true
  accepts_nested_attributes_for :venue, reject_if: :all_blank

  def self.by_band(band)
    band = Band.find_by(name: band)
    where(band: band.id)
  end

  def self.by_venue(venue_id)
    where(venue: venue_id)
  end

  def self.by_date(date)
    where(concerts: {date: date})
  end

end
