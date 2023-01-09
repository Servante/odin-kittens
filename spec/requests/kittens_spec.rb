require 'rails_helper'

RSpec.describe "Kittens", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/kittens/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/kittens/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/kittens/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/kittens/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
