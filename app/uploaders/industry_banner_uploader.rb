class IndustryBannerUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_fill: [369, 227]
  end
end
