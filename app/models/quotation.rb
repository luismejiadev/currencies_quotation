class Quotation < ApplicationRecord
  belongs_to :currency
  def self.json_serialize(rows)
    data = []
    rows.each do |obj|
      values = {
        bid_value: obj.bid_value.to_f,
        ask_value: obj.ask_value.to_f,
        date: obj.date.strftime("%H")
      }
      data.push(values)
    end
    return data.to_json
  end
end
