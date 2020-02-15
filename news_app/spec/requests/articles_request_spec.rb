require 'rails_helper'

RSpec.describe "Articles", type: :request do

  context "guest" do

    describe "GET /index" do
      it "returns http success" do
        get articles_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

  end

  context "user" do

    let(:user) { User.create!(email: "user@email.com", password: "user1234") }
    let(:article) { Article.create!(
      title: "2020 Tech Trends", 
      content: "The following is a list of tech trends for the year 2020.", 
      category: 'tech', 
      user: user) 
    }

    describe "GET /index" do
      it "returns http success" do
        get articles_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

    describe "GET /show" do
      before do
        sign_in(user)
      end

      it "returns http success" do
        get "/articles/#{@article}"
        expect(response).to have_http_status(:success)
      end
    end

  end

  context "editor" do

    let(:user) { User.create!(email: "user@email.com", password: "user1234", role: :editor) }
    let(:article) { Article.create!(
      title: "2020 Tech Trends", 
      content: "The following is a list of tech trends for the year 2020.", 
      category: 'tech', 
      user: user) 
    }

    describe "GET /index" do
      it "returns http success" do
        get articles_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

    describe "GET /show" do
      before do
        sign_in(user)
      end

      it "returns http success" do
        get "/articles/#{@article}"
        expect(response).to have_http_status(:success)
      end
    end
  end

  context "admin" do

    let(:user) { User.create!(email: "user@email.com", password: "user1234", role: :admin) }
    let(:article) { Article.create!(
      title: "2020 Tech Trends", 
      content: "The following is a list of tech trends for the year 2020.", 
      category: 'tech', 
      user: user) 
    }

    describe "GET /index" do
      it "returns http success" do
        get articles_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

    describe "GET /show" do
      before do
        sign_in(user)
      end

      it "returns http success" do
        get "/articles/#{@article}"
        expect(response).to have_http_status(:success)
      end
    end
  end

  # describe "GET /index" do
  #   it "returns http success" do
  #     get articles_path
  #     expect(response).to have_http_status(:success)
  #     expect(response).to render_template(:index)
  #   end
  # end

#   describe "GET /show" do
#     it "returns http success" do
#       get "/articles/show"
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET /new" do
#     it "returns http success" do
#       get "/articles/new"
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET /edit" do
#     it "returns http success" do
#       get "/articles/edit"
#       expect(response).to have_http_status(:success)
#     end
#   end
 end
