class AddIsAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :is_active, :boolean, default: true
  end
end
