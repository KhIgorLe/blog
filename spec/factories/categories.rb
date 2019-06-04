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

FactoryBot.define do
  factory :category do
    sequence :name do |n|
      "My name#{[*'aaa'..'zzz'][n]}."
    end

    description {"MyDescription"}

    trait :invalid do
      name { nil }
    end
  end
end
