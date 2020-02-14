require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:user) { User.create!(email: "user@email.com", password: "user1234") }
  let(:article) { Article.create!(
    title: "2020 Tech Trends", 
    content: "The following is a list of tech trends for the year 2020.", 
    category: 'tech', 
    user: user) 
  }

  describe "GET /index" do
    it "returns http success" do
      get "/articles/index"
      expect(response).to have_http_status(:success)
    end
    #test doesn't pass. Meant for a controller spec.
    it "returns http success" do
      get "/articles/index"
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/articles/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/articles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/articles/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
