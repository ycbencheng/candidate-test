require 'rails_helper'
require 'rspec-rails'

RSpec.describe Article, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:user) }
  end

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:category).class_name('Category') }
  end

  describe 'class methods' do
  end
end
