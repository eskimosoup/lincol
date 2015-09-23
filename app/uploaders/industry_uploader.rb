class IndustryUploader < Optimadmin::ImageUploader

  version :header do
    process resize_to_fill: [811, 163]
  end
end
