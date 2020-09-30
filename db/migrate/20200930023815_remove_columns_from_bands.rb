class RemoveColumnsFromBands < ActiveRecord::Migration[6.0]
  def change
    remove_column :bands, :band_size, :integer
  end
end
