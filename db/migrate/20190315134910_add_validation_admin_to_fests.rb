class AddValidationAdminToFests < ActiveRecord::Migration[5.2]
  def change
    add_column :fests, :validation_admin, :boolean
  end
end
