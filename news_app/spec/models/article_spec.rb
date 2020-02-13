require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create!(email: "user@email.com", password: "user1234") }
  let(:article) { Article.create!(
    title: "2020 Tech Trends", 
    content: "The following is a list of tech trends for the year 2020.", 
    category: 'tech', 
    user: user) 
  }

  describe "attributes" do
    it "has title, content, category and user attributes" do
      expect(article).to have_attributes(
        title: "2020 Tech Trends", 
        content: "The following is a list of tech trends for the year 2020.", 
        category: 'tech', 
        user: user
      )
    end
  end
end
