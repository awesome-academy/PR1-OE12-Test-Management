class User < ApplicationRecord
  before_save {email.downcase!}
  validates :user_name,  presence: true,
    length: {maximum: Settings.num_50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.num_225}, format: {with:VALID_EMAIL_REGEX},
    uniqueness: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.num_6},
    allow_nil: true
end
