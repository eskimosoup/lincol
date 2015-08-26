class IndustryUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [811, 163]
  end

  version :homepage do
    process resize_to_fill: [440, 144]
  end
end
