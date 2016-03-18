class Campaign < ActiveRecord::Base
	belongs_to :user
	has_many :payments
	has_and_belongs_to_many :categories
<<<<<<< HEAD
	mount_uploader :upload, UploadUploader
=======
	has_many :comments
>>>>>>> c9317bbf39ef4bff4c7af277ee417bb18db425d4
end
