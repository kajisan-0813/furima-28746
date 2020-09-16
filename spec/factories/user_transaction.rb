FactoryBot.define do
  factory :user_donation do
    post_code { '123-4567' }
    prefecture { 1 }
    city { '本巣市政田' }
    adress{'2276番地2'}
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678'}
  end

end