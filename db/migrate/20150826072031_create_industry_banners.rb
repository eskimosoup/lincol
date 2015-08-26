class CreateIndustryBanners < ActiveRecord::Migration
  def change
    create_table :industry_banners do |t|
      t.integer :position
      t.string :title, null: false
      t.text :content
      t.string :button_text, null: false
      t.string :more_text, default: 'Read more'
      t.string :more_link
      t.string :image
      t.boolean :display, default: true
      t.belongs_to :industry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
