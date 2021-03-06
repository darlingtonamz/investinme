class Campaign < ActiveRecord::Base
	belongs_to :user
	has_many :payments
	has_and_belongs_to_many :categories
	mount_uploader :upload, UploadUploader
	mount_uploader :display, UploadUploader
	has_many :comments
end
