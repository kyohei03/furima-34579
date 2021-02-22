FactoryBot.define do
  factory :item do
    image         {Faker::Lorem.sentence}
    name          {"オムライス"}
    price         {"1000"}
    description   {"美味しい"}
    status_id     {"2"}
    judgment_id   {"2"}
    cost_id       {"2"}
    days_id       {"2"}
    prefecture_id {"2"}
  end
end