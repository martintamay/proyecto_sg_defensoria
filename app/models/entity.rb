class Entity < ApplicationRecord
	belongs_to :suspect, optional: true

	def full_name 
		self.name + " " + self.last_name
	end
end
