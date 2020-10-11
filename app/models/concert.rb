class Concert < ApplicationRecord
  belongs_to :band
  belongs_to :venue
  validates :date, presence: :true
  validates_associated :band, :venue
  accepts_nested_attributes_for :venue, reject_if: :all_blank

  def self.search(params)
    data = {}
    params.each do |key, value| 
      data.store(key, value) if !value.empty?
    end
    where(concerts: data)
  end

  def past_show
  end

end
