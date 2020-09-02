FactoryBot.define do
  factory :user do
    nickname { 'yutaka' }
    email { 'yutakakajiwara0813@gmail.com' }
    family_name { '梶原' }
    first_name { '優' }
    family_name_kana { 'カナ' }
    first_name_kana { 'カナ' }
    password { 'kome0813' }
    password_confirmation { password }
    birth_day { '1986-08-13' }
  end
end
