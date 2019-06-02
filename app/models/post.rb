class Post < ApplicationRecord
  belongs_to :category

  validates :name, :content, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[A-Z][a-z]+\s[a-z][a-z]+[.]\z/ }
end
