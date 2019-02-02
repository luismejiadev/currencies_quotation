require 'net/http'

Rails.logger.info "Importing Quotations"

def load_data(currency)
  currencies = {
    'EUR': 5,
    'USD': 1,
    'AUD': 19,
    'ARS': 11
  }
  intervals = [
    "",       # day
    "week",   # week
    "month",  # 1 month
    "months",  # 3 months
    "year"    # 1 year
  ]
  params = "?format=JSON&fields=bidvalue,askvalue,maxbid,minbid,variationbid,variationpercentbid,openbidvalue,date&currency="
  currency_id = currencies[currency.code.to_sym]

  intervals.each do |interval|
    Rails.logger.info "Loading data for #{interval}"
    api_url = (interval == "")? "https://api.cotacoes.uol.com/currency/intraday/list/" : "https://api.cotacoes.uol.com/currency/interday/list/"
    url = [api_url, interval, params, currency_id].join("")
    data = []
    send_request(url)["docs"].each do | row |
      values = {
        :currency => currency,
        :bid_value => row["bidvalue"],
        :ask_value => row["askvalue"],
        :max_bid => row["maxbid"],
        :min_bid => row["minbid"],
        :variation_bid => row["variationbid"],
        :variation_percent_bid => row["bidvalue"],
        :open_bid_value => row["openbidvalue"],
        :date => DateTime.parse(row["date"]),
        :interval => (interval == '')? 'day' : interval
      }
      data.push(values)
    end
    Quotation.create(data)
  end
end

def send_request(url)
  Rails.logger.info "send request #{url}"
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  res = http.get(uri.request_uri)
  response = res.body
  Rails.logger.info response
  response = JSON.parse(response)
  return response
end

Currency.all.each do | currency|
  load_data(currency)
end