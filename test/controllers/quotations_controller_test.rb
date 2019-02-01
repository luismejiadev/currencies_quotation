require 'test_helper'

class QuotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quotation = quotations(:one)
  end

  test "should get index" do
    get quotations_url
    assert_response :success
  end

  test "should get new" do
    get new_quotation_url
    assert_response :success
  end

  test "should create quotation" do
    assert_difference('Quotation.count') do
      post quotations_url, params: { quotation: { ask_value: @quotation.ask_value, bid_value: @quotation.bid_value, created_at: @quotation.created_at, currency_id: @quotation.currency_id, date: @quotation.date, max_bid: @quotation.max_bid, min_bid: @quotation.min_bid, open_bid_value: @quotation.open_bid_value, updated_at: @quotation.updated_at, variation_bid: @quotation.variation_bid } }
    end

    assert_redirected_to quotation_url(Quotation.last)
  end

  test "should show quotation" do
    get quotation_url(@quotation)
    assert_response :success
  end

  test "should get edit" do
    get edit_quotation_url(@quotation)
    assert_response :success
  end

  test "should update quotation" do
    patch quotation_url(@quotation), params: { quotation: { ask_value: @quotation.ask_value, bid_value: @quotation.bid_value, created_at: @quotation.created_at, currency_id: @quotation.currency_id, date: @quotation.date, max_bid: @quotation.max_bid, min_bid: @quotation.min_bid, open_bid_value: @quotation.open_bid_value, updated_at: @quotation.updated_at, variation_bid: @quotation.variation_bid } }
    assert_redirected_to quotation_url(@quotation)
  end

  test "should destroy quotation" do
    assert_difference('Quotation.count', -1) do
      delete quotation_url(@quotation)
    end

    assert_redirected_to quotations_url
  end
end
