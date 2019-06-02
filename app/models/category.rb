# == Schema Information
#
# Table name: categories
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ApplicationRecord
  include Commentable
  has_many :posts, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[A-Z][a-z]+\s[a-z][a-z]+[.]\z/ }
end
