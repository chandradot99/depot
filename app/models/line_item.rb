class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def total_price
  	product.price * quantity
  end

  def change_quantity(item,newQuantity)
    product = Product.find_by(id: item.product_id)
    product.available_quantity += item.quantity.to_i
    product.available_quantity -= newQuantity
    product.save
    item.quantity = newQuantity
    item.save
  end
end
