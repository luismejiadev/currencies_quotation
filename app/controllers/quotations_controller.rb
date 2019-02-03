class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  # GET /quotations
  # GET /quotations.json
  def index
    puts params
    currency = params["currrency"]
    interval = params["interval"] || 'day'

    @quotations = Quotation.all.order("currency_id asc, date asc")
    puts "currency #{currency}"
    puts currency.present?
    if currency.present?
      currency = Currency.find_by(code: currency)
      start_day = Date.today - Quotation.get_date_interval(interval)
      puts start_day
      @quotations = @quotations.where(
        currency: currency,
        interval: interval
      ).where("date >= ?", start_day)
      .order("date asc")
    end
    if request.format != 'application/json'
      page_limit = params.fetch(:limit, 20)
      @quotations = @quotations.paginate(page: params[:page], per_page: page_limit)
    end
    respond_to do |format|
      format.html
      format.json do
        render json: Quotation.json_serialize(@quotations, interval)
      end
    end
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = Quotation.new(quotation_params)

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to @quotation, notice: 'Quotation was successfully created.' }
        format.json { render :show, status: :created, location: @quotation }
      else
        format.html { render :new }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1
  # PATCH/PUT /quotations/1.json
  def update
    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to @quotation, notice: 'Quotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render :edit }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation.destroy
    respond_to do |format|
      format.html { redirect_to quotations_url, notice: 'Quotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_params
      params.require(:quotation).permit(:currency_id, :bid_value, :ask_value, :max_bid, :min_bid, :variation_bid, :open_bid_value, :date, :created_at, :updated_at)
    end
end
