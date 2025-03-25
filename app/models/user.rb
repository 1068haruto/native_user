class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
	# 英数字をそれぞれ1字以上含む半角のみの構成
	validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/ }
end
