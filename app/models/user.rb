class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  
  NAME_REGEX_KANJI = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  NAME_REGEX_KANA = /\A[ァ-ヶー－]+\z/
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true do
    validates :nickname
    validates :last_name,  format: { with: NAME_REGEX_KANJI, message: 'Full-width characters' }
    validates :first_name, format: { with: NAME_REGEX_KANJI, message: 'Full-width characters' }
    validates :last_name_kana,  format: { with: NAME_REGEX_KANA, message: 'Full-width katakana characters' }
    validates :first_name_kana, format: { with: NAME_REGEX_KANA, message: 'Full-width katakana characters' }
    validates :birth_day
  end
end
