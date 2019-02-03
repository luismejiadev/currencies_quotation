class Quotation < ApplicationRecord
  belongs_to :currency

  INTERVALS = {
    'day': {date_interval: 1.day, date_format: "%H", maxLabels: 6},
    'week': { date_interval: 7.day, date_format: "%b/%d", maxLabels: 7},
    'month': { date_interval: 1.month, date_format: "%b/%d", maxLabels: 15},
    'months': { date_interval: 3.month, date_format: "%b", maxLabels: 3},
    'year': { date_interval: 1.year, date_format: "%b/%y", maxLabels: 12}
  }

  def self.get_date_interval(interval)
    INTERVALS[interval.to_sym][:date_interval]
  end

  def self.json_serialize(rows, interval)
    puts "interval #{interval}"
    data = []
    labels = []
    interval_config = INTERVALS[interval.to_sym]
    rows.each do |obj|
      values = {
        bid_value: obj.bid_value.to_f,
        ask_value: obj.ask_value.to_f,
        date: obj.date.strftime("%Y-%m-%d %H:%M")
      }
      labels.push(obj.date.strftime(interval_config[:date_format]))
      data.push(values)
    end
    return {data: data, labels: labels, maxLabels: interval_config[:maxLabels]}.to_json
  end
end
