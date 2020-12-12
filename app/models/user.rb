class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, presence: true, 
  # validates :name, uniqueness: true
  # validates :nick_name, presence: true,
  # validates :mail, presence: true,
  # validates :mail, uniqueness: true.
  # validates :mail, inclusion: {in:%w(@)},
  # validates :password, length: {minimum: 6},
  # VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  # validates :password, format: {with: VALID_PASSWROD_REGEX }
  # validates :password, password_confirmation, confirmation: true

  with_options presence: true do
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'is invalid. Input email.' }, uniqueness: { case_sensitive: false }
    validates :nick_name, presence: true
    validates :encrypted_password, format: { with: /\A[a-z\d]{6,}+\z/i, message: 'is invalid. Input password.' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :kana_family_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_date
    validates :password, format: { with: /\A[a-z\d]{8,}+\z/i, message: 'is invalid. Input password.' }
  end
end

