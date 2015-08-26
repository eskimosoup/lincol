class CreateFrequentlyAskedQuestions < ActiveRecord::Migration
  def change
    create_table :frequently_asked_questions do |t|
      t.string :question, null: false
      t.text :answer, null: false
      t.integer :position
      t.belongs_to :industry, index: true, foreign_key: true
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
