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

class Post < ApplicationRecord
  include Commentable
  belongs_to :category

  validates :name, :content, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[A-Z][a-z]+\s[a-z][a-z]+[.]\z/ }
end
