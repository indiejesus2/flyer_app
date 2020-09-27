class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.integer :band_size

      t.timestamps
    end
  end
end
