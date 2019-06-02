require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:category) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }

  describe 'validate uniqueness of name' do
    let(:post) { create(:post) }
    subject { post }

    it { should validate_uniqueness_of(:name) }
  end
end
