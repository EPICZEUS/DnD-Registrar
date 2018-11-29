class User < ApplicationRecord
	validates :name, presence: true, uniqueness: true

	has_one :campaign
	has_many :characters
	has_many :campaigns, through: :characters

	def is_dm?
		self.campaign
	end
end
