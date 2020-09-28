class Concert < ApplicationRecord
  belongs_to :band
  belongs_to :venue
  validates :date, presence: :true
  accepts_nested_attributes_for :venue, reject_if: :all_blank
end
