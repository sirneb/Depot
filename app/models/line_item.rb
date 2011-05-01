class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  default_scope :order => 'line_items.created_at DESC'
  def total_price
    price 
  end
end
