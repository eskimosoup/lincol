class AddSummaryToIndustry < ActiveRecord::Migration
  def change
    add_column :industries, :summary, :text
  end
end
