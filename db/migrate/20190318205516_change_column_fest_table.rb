class ChangeColumnFestTable < ActiveRecord::Migration[5.2]
  def change
    change_column :fests, :start_date, :date
    change_column :fests, :end_date, :date
  end
end
