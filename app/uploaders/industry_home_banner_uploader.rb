class IndustryHomeBannerUploader < Optimadmin::ImageUploader
  version :homepage do
    process resize_to_limit: [182, 265]
  end
end
