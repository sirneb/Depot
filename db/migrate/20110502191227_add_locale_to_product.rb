class AddLocaleToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :locale, :string
    Product.all.each do |product|
      if product.locale.nil?
        product.locale = "en"
        product.save
      end
    end
  end

  def self.down
    remove_column :products, :locale
  end
end
