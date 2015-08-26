class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :image
      t.string :job_title
      t.integer :position
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
