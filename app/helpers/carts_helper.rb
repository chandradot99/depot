module CartsHelper
  def available_quantity2(id)
    product = Product.find_by(id: id)
    array = Array.new
    i = 0
    (product.available_quantity).times do
      i = i + 1 
      array.push(i)
    end
    array
  end
end
