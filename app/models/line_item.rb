class LineItem < ActiveRecord::Base
  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true
  
  belongs_to :order
  belongs_to :product


end
