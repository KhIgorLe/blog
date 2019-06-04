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

class Post < ApplicationRecord
  include Commentable
  belongs_to :category
  has_one_attached :file

  validates :name, presence: true
  validates :name, format: { with: NAME_REGEX, message: MESSAGE_FORMAT_NAME }
  validates :file, size: { less_than: 2.megabytes, message: 'must be less than 2 MB' }
end
