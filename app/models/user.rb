class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, 
  validates :name, uniqueness: true
  validates :nick_name, presence: true,
  validates :mail, presence: true,
  validates :mail, uniqueness: true.
  validates :mail, inclusion: {in:%w(@)},
  validates :password, length: {minimum: 6},
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: {with: VALID_PASSWROD_REGEX }
  validates :password, password_confirmation, confirmation: true
end
