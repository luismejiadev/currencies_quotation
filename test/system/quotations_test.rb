require "application_system_test_case"

class QuotationsTest < ApplicationSystemTestCase
  setup do
    @quotation = quotations(:one)
  end

  test "visiting the index" do
    visit quotations_url
    assert_selector "h1", text: "Quotations"
  end

  test "creating a Quotation" do
    visit quotations_url
    click_on "New Quotation"

    fill_in "Ask value", with: @quotation.ask_value
    fill_in "Bid value", with: @quotation.bid_value
    fill_in "Created at", with: @quotation.created_at
    fill_in "Currency", with: @quotation.currency_id
    fill_in "Date", with: @quotation.date
    fill_in "Max bid", with: @quotation.max_bid
    fill_in "Min bid", with: @quotation.min_bid
    fill_in "Open bid value", with: @quotation.open_bid_value
    fill_in "Updated at", with: @quotation.updated_at
    fill_in "Variation bid", with: @quotation.variation_bid
    click_on "Create Quotation"

    assert_text "Quotation was successfully created"
    click_on "Back"
  end

  test "updating a Quotation" do
    visit quotations_url
    click_on "Edit", match: :first

    fill_in "Ask value", with: @quotation.ask_value
    fill_in "Bid value", with: @quotation.bid_value
    fill_in "Created at", with: @quotation.created_at
    fill_in "Currency", with: @quotation.currency_id
    fill_in "Date", with: @quotation.date
    fill_in "Max bid", with: @quotation.max_bid
    fill_in "Min bid", with: @quotation.min_bid
    fill_in "Open bid value", with: @quotation.open_bid_value
    fill_in "Updated at", with: @quotation.updated_at
    fill_in "Variation bid", with: @quotation.variation_bid
    click_on "Update Quotation"

    assert_text "Quotation was successfully updated"
    click_on "Back"
  end

  test "destroying a Quotation" do
    visit quotations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quotation was successfully destroyed"
  end
end
