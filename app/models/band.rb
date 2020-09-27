class Band < ApplicationRecord
    has_many :concerts
    has_many :venues, through: :concerts
end
