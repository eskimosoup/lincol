class CreateGeneralDownloads < ActiveRecord::Migration
  def change
    create_table :general_downloads do |t|
      t.string :title, null: false
      t.string :file, null: false
      t.string :image, null: false
      t.boolean :display, default: true
      t.belongs_to :industry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
