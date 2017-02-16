class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create do
    UserMailer.email_receipt(self).deliver_now
  end

end
