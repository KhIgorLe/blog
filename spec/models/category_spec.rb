# == Schema Information
#
# Table name: categories
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:posts).dependent(:destroy) }

  it { should validate_presence_of(:name) }

  it_behaves_like 'valid format', :name

  it_behaves_like 'not valid format', :name

  describe 'commentable' do
    it_behaves_like 'has many comments'
  end
end
