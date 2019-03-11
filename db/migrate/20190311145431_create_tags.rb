class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.belongs_to :music_type, index: true
      t.belongs_to :fest, index: true

      t.timestamps
    end
  end
end
