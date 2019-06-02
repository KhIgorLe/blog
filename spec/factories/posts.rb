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


FactoryBot.define do
  factory :post do
    sequence :name do |n|
      "My post#{[*'aaa'..'zzz'][n]}."
    end

    content {"MyDescription"}
    category

    trait :invalid do
      name { nil }
    end
  end
end
