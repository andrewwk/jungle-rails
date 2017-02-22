class User < ActiveRecord::Base

  validates :email,
    case_sensitive: false,
    uniqueness: { message: "already registered" },
    presence: { message: "can't be blank" }

  validates :password, length: { minimum: 1 }
  validates :name, presence: true

  has_secure_password

  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    # Remove any and all whitespace from email
    email = email.gsub(/\s+/, "")

    @user = self.find_by email: email.downcase

    if @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
