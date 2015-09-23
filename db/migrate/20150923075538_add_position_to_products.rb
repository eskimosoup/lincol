class AddPositionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :position, :integer
    add_column :product_ranges, :position, :integer
  end
end
