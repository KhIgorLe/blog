# == Schema Information
#
# Table name: posts
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  content     :text             not null
#  category_id :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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

  describe 'commentable' do
    it_behaves_like 'has many comments'
  end
end
