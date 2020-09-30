class RemoveLocationFromVenues < ActiveRecord::Migration[6.0]
  def change
    remove_column :venues, :location, :string
  end
end
