# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  body             :text             not null
#  commentable_type :string
#  commentable_id   :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :comment do
    sequence :body do |n|
      "MyTextComment#{n}"
    end

    trait :invalid do
      body { nil }
    end
  end
end
