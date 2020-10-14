class Band < ApplicationRecord
    has_one :user
    has_many :concerts
    has_many :venues, through: :concerts
    validates :name, uniqueness: { case_sensitive: false }
    
end
