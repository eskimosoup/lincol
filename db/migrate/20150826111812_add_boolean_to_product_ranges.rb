class AddBooleanToProductRanges < ActiveRecord::Migration
  def change
    remove_column :product_ranges, :display
    add_column :product_ranges, :display, :boolean, default: true
    remove_column :product_ranges, :home_highlight
    add_column :product_ranges, :home_highlight, :boolean, default: true
  end
end
