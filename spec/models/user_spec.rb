require 'rails_helper'
require 'rspec-rails'

RSpec.describe User, type: :model do
  describe 'validation' do

  end

  describe 'associations' do
    it { should have_many(:articles) }
  end

  describe 'class methods' do
  end
end
