class ProductUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_fill: [203, 164]
  end
end
