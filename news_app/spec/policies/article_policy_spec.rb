require 'rails_helper'

RSpec.describe ArticlePolicy, type: :policy do
  let(:user) { User.new }

  subject { described_class }

  permissions ".scope" do
  end

  permissions :show? do
  end

  permissions :new?, :create?, :update?, :edit?, :destroy? do
    it "denies access if user is not logged in" do
      expect(subject).not_to permit(User.new(role: nil))
    end

    it "denies access if user is user (role)" do
      expect(subject).not_to permit(User.new(role: "user"))
    end

    it "denies access if user is admin" do
      expect(subject).not_to permit(User.new(role: "admin"))
    end
  end

end
