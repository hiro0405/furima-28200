FactoryBot.define do
  factory :user do
    nickname {Faker::Name.first_name}
    email {Faker::Internet.free_email}
    password {"1a" +Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {"米倉"}
    first_name {"弘記"}
    family_name_kana {"ヨネクラ"}
    first_name_kana {"ヒロキ"}
    birthday {"2020-07-12"}
  end
end