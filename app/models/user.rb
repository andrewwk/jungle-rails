class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: { strict: true }

  has_secure_password

  has_many :reviews

end
