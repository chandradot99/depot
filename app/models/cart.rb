class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id, number)
		current_item = line_items.find_by(product_id: product_id)

		product = Product.find_by(id: product_id)
		product.available_quantity -= number
		product.save

		if current_item
			current_item.quantity += number
		else
			current_item = line_items.build(product_id: product_id)
			current_item.quantity = number
		end
	current_item
	end


	def unlock_quantity(cart)
		cart.line_items.each do |item| 
			product = Product.find_by(id: item.product_id)
			product.available_quantity += item.quantity 
			product.save
		end
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price}
	end
end
