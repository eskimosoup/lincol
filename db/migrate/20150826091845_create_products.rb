class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.text :description
      t.string :technical_specification
      t.string :image
      t.string :video_url
      t.belongs_to :product_range, index: true, foreign_key: true
      t.boolean :display, default: true
      t.string :suggested_url, unique: true
      t.string :slug, unique: true

      t.timestamps null: false
    end
  end
end
