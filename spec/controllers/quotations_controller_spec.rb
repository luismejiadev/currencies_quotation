require 'rails_helper'

RSpec.describe QuotationsController, type: :controller do
  describe "GET #index" do
    it "render the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #index.json" do
    it "responds with JSON without params" do
      quotations = Quotation.all
      get :index, :format => :json
      expect(response.body).to eq({
        data: [],
        labels: [],
        maxLabels: 6
      }.to_json)
    end

    it "responds with JSON interval day" do
      quotations = Quotation.all
      get :index, :params => {interval: 'day'}, :format => :json
      expect(response.body).to eq({
        data: [],
        labels: [],
        maxLabels: 6
      }.to_json)
    end

    it "responds with JSON interval week" do
      quotations = Quotation.all
      get :index, :params => {interval: 'week'}, :format => :json
      expect(response.body).to eq({
        data: [],
        labels: [],
        maxLabels: 7
      }.to_json)
    end

    it "responds with JSON interval month" do
      quotations = Quotation.all
      get :index, :params => {interval: 'month'}, :format => :json
      expect(response.body).to eq({
        data: [],
        labels: [],
        maxLabels: 15
      }.to_json)
    end

    it "responds with JSON interval months" do
      quotations = Quotation.all
      get :index, :params => {interval: 'months'}, :format => :json
      expect(response.body).to eq({
        data: [],
        labels: [],
        maxLabels: 3
      }.to_json)
    end

    it "responds with JSON interval year" do
      quotations = Quotation.all
      get :index, :params => {interval: 'year'}, :format => :json
      expect(response.body).to eq({
        data: [],
        labels: [],
        maxLabels: 12
      }.to_json)
    end

  end

end
