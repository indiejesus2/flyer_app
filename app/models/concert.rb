class Concert < ApplicationRecord
  belongs_to :band
  belongs_to :venue
  validates :date, presence: :true
  validate :in_future?
  validates_numericality_of :admission, greater_than_or_equal_to: 0
  validates_associated :band, :venue
  accepts_nested_attributes_for :venue, reject_if: :all_blank

  def self.search(params)
    data = {}
    params.each do |key, value| 
      data.store(key, value) if !value.empty?
    end
    where(concerts: data)
  end

  def self.past_show
    Concert.where('date < ?', DateTime.now)
  end

  def self.current_show
    Concert.where('date >= ?', DateTime.now).order(:date)
  end

  def in_future?
    if date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end
