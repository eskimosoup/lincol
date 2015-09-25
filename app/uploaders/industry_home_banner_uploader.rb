class IndustryHomeBannerUploader < Optimadmin::ImageUploader
  version :homepage do
    process resize_to_fit: [440, 186]
  end
end
