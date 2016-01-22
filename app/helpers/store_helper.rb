module StoreHelper
  def available_quantity(quantity)
    array = Array.new
    i = 0
    quantity.times do
      i = i + 1 
      array.push(i)
    end
    array
  end
end
