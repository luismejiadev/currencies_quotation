class HomeController < ApplicationController
  skip_before_action :require_login

  def index
    @currencies = Currency.all
    @current_currency = @currencies.first
    @quotations = Quotation.where(
      currency: @current_currency,
      interval: 'year',
    ).where(
      "date >= ?", Date.today() - 12.months
    )
    page_limit = params.fetch(:limit, 20)
    @quotations = @quotations.paginate(page: params[:page], per_page: page_limit)

  end
end
