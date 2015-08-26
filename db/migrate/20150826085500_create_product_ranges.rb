class CreateProductRanges < ActiveRecord::Migration
  def change
    create_table :product_ranges do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.string :image
      t.belongs_to :industry, index: true, foreign_key: true
      t.string :home_highlight
      t.string :display, default: true
      t.string :suggested_url, unique: true
      t.string :slug, unique: true

      t.timestamps null: false
    end
  end
end
