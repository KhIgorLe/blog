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

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :content, :author, presence: true
  validates :author, format: { with: AUTHOR_MANE_REGEX, message: MESSAGE_FORMAT_AUTHOR }
end
