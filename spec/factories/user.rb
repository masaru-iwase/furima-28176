   FactoryBot.define do
      factory :user do
        email                 {Faker::Internet.free_email}
        nick_name              {Faker::Name.initials(number: 2)}
        family_name           {"岩瀬"}
        first_name            {"大"}
        kana_family_name      {"イワセ"}
        kana_first_name       {"マサル"}
        birth_date            {"1900-01-01"}
        password              {Faker::Internet.password(min_length: 6)}
        password_confirmation {password}
     end
   end