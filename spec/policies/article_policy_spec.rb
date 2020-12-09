require 'rails_helper'

RSpec.describe ArticlePolicy do
  subject { described_class.new(user, article) }

  let(:user) { User.create }
  let(:article) { Article.create }

  context 'being a visitor' do
    let(:user) { nil }
    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_actions(%i[show create new update edit destroy]) }
  end

  context 'being a user' do
    let(:user) { User.create(role: 'user') }
    it { is_expected.to permit_actions(%i[index show]) }
    it { is_expected.to forbid_actions(%i[create new update edit destroy]) }
  end

  context 'being a editor' do
    let(:user) { User.create(role: 'editor') }
    it { is_expected.to permit_actions(%i[index show create new update edit destroy]) }
  end

end

