class User < ActiveRecord::Base

  validates :email, presence: true, case_sensitive: false, uniqueness: true
  validates :password, length: { minimum: 10 }
  validates :name, presence: true

  has_secure_password

  has_many :reviews

end
