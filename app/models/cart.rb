class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
      current_item.price += Product.find_by_id(product_id).price
    else
      # no current item exists
      current_item = line_items.build(:product_id => product_id)
      current_item.price = Product.find_by_id(product_id).price
    end

    current_item
  end

  def total_price
    sum = 0
    line_items.each do |item|
      sum += item.total_price
    end
    return sum
  end
end
