class CalculatePriceInLineItems < ActiveRecord::Migration
  def self.up
    LineItem.all.each do |item|
      item.price = 0
      item.price = item.product.price * item.quantity
      item.save
    end
  end

  def self.down
  end
end
