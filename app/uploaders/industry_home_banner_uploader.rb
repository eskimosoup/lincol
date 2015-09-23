class IndustryHomeBannerUploader < Optimadmin::ImageUploader
  version :homepage do
    process resize_to_limit: [176, 266]
  end
end
