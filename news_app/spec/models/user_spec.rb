require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "user@email.com", password: "user1234") }

  describe "attributes" do
    it "has email and password attributes" do
      expect(user).to have_attributes(email: "user@email.com", password: "user1234")
    end
  end
end
