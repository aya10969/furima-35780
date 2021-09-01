FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"山田"}
    name                  {"太郎"}
    last_name_furigana            {"ヤマダ"}
    name_furigana             {"タロウ"}
    birthday              {"1991-06-01"}
   
  end
end