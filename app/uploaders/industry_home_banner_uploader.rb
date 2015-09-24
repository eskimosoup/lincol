class IndustryHomeBannerUploader < Optimadmin::ImageUploader
  version :homepage do
    process resize_to_fit: [200, 265]
  end
end
