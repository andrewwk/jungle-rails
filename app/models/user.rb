class User < ActiveRecord::Base

  validates :email, presence: true, case_sensitive: false, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :name, presence: true

  has_secure_password

  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    # @email = email
    # @password = password

    # if @email.valid? && @password.valid?
      @user = self.find_by email: email

      if @user.authenticate(password)
        @user
      else
        nil
      end

    # else
    #   nil
    # end

  end

end
