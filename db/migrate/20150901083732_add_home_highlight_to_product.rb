class AddHomeHighlightToProduct < ActiveRecord::Migration
  def change
    add_column :products, :home_highlight, :boolean
  end
end
