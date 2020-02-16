require 'rails_helper'

RSpec.describe "Articles", type: :request do

  context "guest" do

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
      it "returns http redirect" do
        get article_path(article)
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /new" do
      it "returns http redirect" do
        get new_article_path
        expect(response).to have_http_status(302)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post "/articles", :params => { article: {
          :title => "New article", 
          :content => "The following is a list of tech trends for the year 2020.", 
          :category =>'tech', 
          :user => nil
          }
        }
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /edit" do
      it "returns http redirect" do
        get edit_article_path(article)
        expect(response).to have_http_status(302)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        put "/articles/#{article.id}", :params => { article: {
          :title => "Edited article", 
          :content => "The following is a list of tech trends for the year 2020.", 
          :category =>'tech', 
          :user => "user"
          }
        }
        expect(response).to have_http_status(302)
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

    before do
      sign_in(user)
    end

    describe "GET /index" do
      it "returns http success" do
        get articles_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

    describe "GET /show" do
      it "returns http success" do
        get article_path(article)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /new" do
      it "returns http success" do
        get new_article_path
        expect(response).to have_http_status(302)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post "/articles", :params => { article: {
          :title => "New article", 
          :content => "The following is a list of tech trends for the year 2020.", 
          :category =>'tech', 
          :user => :user
          }
        }
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /edit" do
      it "returns http success" do
        get edit_article_path(article)
        expect(response).to have_http_status(302)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        put "/articles/#{article.id}", :params => { article: {
          :title => "Edited article", 
          :content => "The following is a list of tech trends for the year 2020.", 
          :category =>'tech', 
          :user => :user
          }
        }
        expect(response).to have_http_status(302)
      end
    end

  end

  context "editor" do

    let(:user) { User.create!(email: "user@email.com", password: "user1234", role: :user) }
    let(:editor) { User.create!(email: "editor@email.com", password: "editor1234", role: :editor) }
    let(:article) { Article.create!(
      title: "2020 Tech Trends",
      content: "The following is a list of tech trends for the year 2020.", 
      category: 'tech', 
      user: editor) 
    }

    before do
      sign_in(editor)
    end

    describe "GET /index" do
      it "returns http success" do
        get articles_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

    describe "GET /show" do
      it "returns http success" do
        get article_path(article)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /new" do
      it "returns http success" do
        get new_article_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post "/articles", :params => { article: {
          :title => "New article", 
          :content => "The following is a list of tech trends for the year 2020.", 
          :category =>'tech', 
          :user => :user
          }
        }
        expect(response).to redirect_to(assigns(:article))
      end
    end

    describe "GET /edit" do
      it "returns http success" do
        get edit_article_path(article)
        expect(response).to have_http_status(:success)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        put "/articles/#{article.id}", :params => { article: {
          :title => "Edited article", 
          :content => "The following is a list of tech trends for the year 2020.", 
          :category =>'tech', 
          :user => :user
          }
        }
        expect(response).to redirect_to(assigns(:article))
      end
    end

  end

  context "admin" do

    let(:user) { User.create!(email: "user@email.com", password: "user1234", role: "editor") }
    let(:admin) { User.create!(email: "admin@email.com", password: "admin1234", role: "admin") }

    let(:article) { Article.create!(
      title: "2020 Tech Trends", 
      content: "The following is a list of tech trends for the year 2020.", 
      category: 'tech', 
      user: user) 
    }

    before do
      sign_in(admin)
    end

    describe "GET /index" do
      it "returns http success" do
        get articles_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

    describe "GET /show" do
      it "returns http success" do
        get article_path(article)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /new" do
      it "returns http success" do
        get new_article_path
        expect(response).to have_http_status(302)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post "/articles", :params => { article: {
          :title => "New article", 
          :content => "The following is a list of tech trends for the year 2020.", 
          :category =>'tech', 
          :user => :admin
          }
        }
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /edit" do
      it "returns http success" do
        get edit_article_path(article)
        expect(response).to have_http_status(302)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        put "/articles/#{article.id}", :params => { article: {
          :title => "Edited article", 
          :content => "The following is a list of tech trends for the year 2020.", 
          :category => 'tech', 
          :user => :user
          }
        }
        expect(response).to redirect_to(assigns(:article))
      end
    end
  end
end
