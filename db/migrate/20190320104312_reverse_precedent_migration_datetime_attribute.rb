class ReversePrecedentMigrationDatetimeAttribute < ActiveRecord::Migration[5.2]
  def change
    change_column :fests, :start_date, :datetime
    change_column :fests, :end_date, :datetime
  end
end
