require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "testuser@test.com", password: "123456")  }

  it "is valid with a email and password" do
    expect(user).to be_valid
  end
end
