require 'rails_helper'

RSpec.describe "Indices", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/index/new"
      expect(response).to have_http_status(:success)
    end
  end

end
