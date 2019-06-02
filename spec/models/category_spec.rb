# == Schema Information
#
# Table name: categories
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:posts).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

  describe 'validate uniqueness of name' do
    let(:category) { create(:category) }
    subject { category }

    it { should validate_uniqueness_of(:name) }
  end
end
