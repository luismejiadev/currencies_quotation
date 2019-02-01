class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.references :currency, foreign_key: true
      t.decimal :bid_value
      t.decimal :ask_value
      t.decimal :max_bid
      t.decimal :min_bid
      t.decimal :variation_bid
      t.decimal :variation_percent_bid
      t.decimal :open_bid_value
      t.datetime :date
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
