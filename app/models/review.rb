class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates_associated :user

  validates :user_id, :product_id, :description, :rating, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :rating, numericality: { only_integer: true }

end
