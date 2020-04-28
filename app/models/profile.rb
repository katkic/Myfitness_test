class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :header_image, HeaderImageUploader
  mount_uploader :icon, UserIconUploader
end
