# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  content          :text             not null
#  commentable_type :string
#  commentable_id   :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  author           :string           not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:commentable) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:author) }

  describe 'author' do
    ['Ivan Petrov.', 'Iv Pe.', 'Ivan Petrov Leonidovich.'].each do |value|
      it { should allow_value(value).for(:author) }
    end

    ['Ivan petrov', 'ivan Petrov.', 'ivan petrov.', 'Ivan p.', 'Iva.n Petrov.'].each do |value|
      it { should_not allow_value(value).for(:author) }
    end
  end
end
