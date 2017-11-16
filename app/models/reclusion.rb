class Reclusion < ApplicationRecord
	validates :place, :presence => true
	validates :date_entry, :presence => true
  resourcify
  belongs_to :suspect
end
