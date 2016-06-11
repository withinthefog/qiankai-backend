class FixDisplayOrderForOldProducts < ActiveRecord::Migration
  def up
    Product.all.each { |product| product.update_attributes(display_order: product.id) }
  end

  def down
    Product.all.each { |product| product.update_attributes(display_order: 0) }
  end
end
