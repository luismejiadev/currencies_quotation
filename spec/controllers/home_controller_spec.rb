require 'rails_helper'

RSpec.describe QuotationsController, type: :controller do
  describe "GET #index" do
    it "render the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
