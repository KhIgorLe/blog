
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
