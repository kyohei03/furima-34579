FactoryBot.define do
  factory :item do
    name          {"オムライス"}
    price         {1000}
    description   {"美味しい"}
    status_id     {2}
    judgment_id   {2}
    cost_id       {2}
    days_id       {2}
    prefecture_id {2}
    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
  end
 end
end

