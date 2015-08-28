class PageUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_fit: [723, 135]
  end

  version :header do
    process resize_to_fill: [811, 163]
  end
end
