class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :location
      t.integer :crowd_capacity
      t.boolean :parking

      t.timestamps
    end
  end
end
