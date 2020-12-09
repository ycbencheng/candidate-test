require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create!(email: "testuser2@test.com", password: "123456")  }

  let(:article) { Article.create!(
    title: "This is your brain on music", 
    content: "Whether you are rocking out to Macklemore & Ryan Lewis in your car or reading with Bach in your bedroom, music has a special ability to pump us up or calm us down.", 
    category: 'Music', 
    user: user) 
  }

  it "is valid with a title, content, category and user" do
    expect(article).to be_valid
  end

  it "belongs to a user" do
    expect(article.user).to eq(user)
  end
end
