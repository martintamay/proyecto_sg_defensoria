class Entity < ApplicationRecord
	validates :name, :presence => true
	validates :last_name, :presence => true
	validates :phone, numericality: { only_integer: true, allow_blank: true }
	validates :birthdate, :presence => true
  resourcify
	belongs_to :suspect, optional: true
	belongs_to :judge, optional: true
	belongs_to :user, optional: true

	def full_name 
		self.name + " " + self.last_name
	end
end
