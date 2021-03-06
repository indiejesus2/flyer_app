class Venue < ApplicationRecord
    has_many :concerts
    has_many :bands, through: :concerts
    validates :name, :city, :state, presence: :true

    def location
        city + ", " + state
    end

    def search
        name + " - " + location
    end

end
