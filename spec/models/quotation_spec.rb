require 'rails_helper'

RSpec.describe Quotation, type: :model do
  describe "get_date_interval" do
    it "return date interval from interval config: day" do
      result = Quotation.get_date_interval('day')
      expect(result).to eq(1.day)
    end
    it "return date interval from interval config: week" do
      result = Quotation.get_date_interval('week')
      expect(result).to eq(7.day)
    end
    it "return date interval from interval config: month" do
      result = Quotation.get_date_interval('month')
      expect(result).to eq(1.month)
    end
    it "return date interval from interval config: months" do
      result = Quotation.get_date_interval('months')
      expect(result).to eq(3.month)
    end
    it "return date interval from interval config: year" do
      result = Quotation.get_date_interval('year')
      expect(result).to eq(1.year)
    end
  end
end
