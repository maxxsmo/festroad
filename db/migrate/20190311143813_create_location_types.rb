class CreateLocationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :location_types do |t|
      t.string :location
      t.timestamps
    end
  end
end
