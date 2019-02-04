class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username,
      t.boolean :is_active,
      t.boolean :is_admin,
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true
  end
end
