class CreateFests < ActiveRecord::Migration[5.2]
  def change
    create_table :fests do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :address
      t.text :description
      t.string :website
      t.timestamps
    end
  end
end
