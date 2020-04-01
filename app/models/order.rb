class Order < ActiveRecord::Base
  
  monetize :total_cents, numericality: true
  
  belongs_to :user
  has_many :line_items

  validates :stripe_charge_id, presence: true
  # validates :price, presence: true
end
