class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :name
      t.string :image
      t.string :colour
      t.integer :position
      t.text :accreditations
      t.string :subdomain
      t.string :menu
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
