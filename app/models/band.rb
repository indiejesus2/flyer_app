class Band < ApplicationRecord
    has_many :concerts
    has_many :venues, through: :concerts
    validates :name, uniqueness: :true
end
