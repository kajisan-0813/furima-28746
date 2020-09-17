FactoryBot.define do
  factory :user_transaction do
    post_code { '123-4567' }
    prefecture { 1 }
    city { '本巣市政田' }
    adress { '2276番地2' }
    building_name { '東京ハイツ' }
    phone_number { '11111111111' }
    token { '0x00007fdcfa31d448' }
  end
end
