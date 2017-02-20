class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true, presence: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price_cents, numericality: true, presence: true
  validates :quantity, numericality: { only_integer: true }, presence: true
  validates :category_id, presence: true

end
