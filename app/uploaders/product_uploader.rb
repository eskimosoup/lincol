class ProductUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_fill: [203, 164]
  end

  version :full do
    process resize_to_fit: [960, 480]
  end
end
