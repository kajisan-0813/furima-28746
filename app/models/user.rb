class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :transactions
  with_options presence: true do
    validates :password, :password_confirmation, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :nickname, :birth_day
  end
end
