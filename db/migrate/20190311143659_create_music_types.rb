class CreateMusicTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :music_types do |t|
      t.string :type
      t.timestamps
    end
  end
end
