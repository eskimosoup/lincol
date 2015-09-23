class AddHomeBannerImageToIndustry < ActiveRecord::Migration
  def change
    add_column :industries, :home_banner_image, :string
  end
end
