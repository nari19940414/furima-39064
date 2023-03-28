FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.first_name + Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false)}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth_date            {'1990-01-01'}
  end
end