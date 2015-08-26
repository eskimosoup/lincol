class AddCounterCacheToProductRange < ActiveRecord::Migration
  def change
    add_column :product_ranges, :products_count, :integer
  end
end
