class AddNameToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :name, :string
  end
end
