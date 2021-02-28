FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 {Faker::Internet.free_email}
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1989-05-30' }
    password              { 'sb851097' }
    password_confirmation { password }
  end
end
