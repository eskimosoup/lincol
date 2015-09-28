class AddIntroductionToIndustry < ActiveRecord::Migration
  def change
    add_column :industries, :introduction, :text
  end
end
