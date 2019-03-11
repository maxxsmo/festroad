class CreateFestLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :fest_locations do |t|
      t.belongs_to :fest, index: true
      t.belongs_to :location_type, index: true
      t.timestamps
    end
  end
end
