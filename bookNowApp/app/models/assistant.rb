class Assistant < ActiveRecord::Base
	belongs_to :user
	mount_uploader :avatar, AvatarUploader
	validate :image_size_validation

	# build functionality - dependent destroy uploaded avatar
 
	private
  
  def image_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end
  
end
