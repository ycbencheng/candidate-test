require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  let(:user) { User.create!(email: "user@email.com", password: "user1234") }
  let(:article) { Article.create!(
    title: "2020 Tech Trends", 
    content: "The following is a list of tech trends for the year 2020.", 
    category: 'tech', 
    user: user) 
  }

  describe "GET #index" do
    it "renders index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  it "assigns [article] to @articles" do
    get :index
    expect(assigns(:articles)).to eq([article])
  end

end
