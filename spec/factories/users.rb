FactoryBot.define do
  factory :user do
    nickname {'Y先輩'}
    email {'yaju@gmail.com'}
    first_name {'野獣'}
    last_name {'先輩'}
    first_name_reading {'ヤジュウ'}
    last_name_reading {'センパイ'}
    birthday {'2000/08/10'}
    password {'yaju810'}
    password_confirmation {password}
  end
end
