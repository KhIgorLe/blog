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

class Category < ApplicationRecord
  include Commentable
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :name, format: { with: NAME_REGEX, message: MESSAGE_FORMAT_NAME }
end
