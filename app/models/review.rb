class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :product_id, :description, :rating, presence: true
  validates :user_id, presence: { message: "must be logged in to post a review " }
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :rating, numericality: { only_integer: true }

end
