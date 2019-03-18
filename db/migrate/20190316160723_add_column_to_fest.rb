class AddColumnToFest < ActiveRecord::Migration[5.2]
  def change
    add_column :fests, :latitude, :float
    add_column :fests, :longitude, :float
  end
end
