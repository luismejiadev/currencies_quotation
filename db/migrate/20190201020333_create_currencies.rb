class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.string :flag
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
