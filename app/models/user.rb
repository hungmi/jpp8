class User < ApplicationRecord
	validates :phone, presence: true
	has_secure_password
end
