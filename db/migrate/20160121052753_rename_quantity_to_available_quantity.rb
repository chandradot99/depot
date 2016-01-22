class RenameQuantityToAvailableQuantity < ActiveRecord::Migration
  def change
        rename_column :products, :quantity, :available_quantity
  end
end
