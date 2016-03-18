class User < ActiveRecord::Base
	has_many :campaigns
	has_many :payments
	has_many :comments
end
