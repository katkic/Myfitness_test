class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :header_image, ImageUploader
  mount_uploader :icon, ImageUploader
end
