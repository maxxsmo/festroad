class ChangeColumnFest < ActiveRecord::Migration[5.2]
  def change
    enable_extension :citext
    change_column :fests, :title, :citext
  end
end
