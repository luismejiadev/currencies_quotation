class HomeController < ApplicationController
  def index
    @currencies = Currency.all
    @current_currency = @currencies.first
  end
end
