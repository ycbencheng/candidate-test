require 'rails_helper'
require 'rspec-rails'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should have_many(:articles) }
  end
end
