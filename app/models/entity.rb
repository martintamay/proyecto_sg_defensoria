class Entity < ApplicationRecord
  resourcify
	belongs_to :suspect, optional: true
	belongs_to :judge, optional: true
	belongs_to :user, optional: true

	def full_name 
		self.name + " " + self.last_name
	end
end
