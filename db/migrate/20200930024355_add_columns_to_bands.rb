class AddColumnsToBands < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :city, :string
    add_column :bands, :state, :string
  end
end
