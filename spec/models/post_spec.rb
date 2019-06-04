# == Schema Information
#
# Table name: posts
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  content     :text
#  category_id :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:category) }

  it { should validate_presence_of(:name) }

  describe 'commentable' do
    it_behaves_like 'has many comments'
  end

  it_behaves_like 'valid format', :name

  it_behaves_like 'not valid format', :name

  it 'have one attached file' do
    expect(Post.new.file).to be_an_instance_of(ActiveStorage::Attached::One)
  end
end
