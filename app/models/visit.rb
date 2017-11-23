class Visit < ApplicationRecord
	audited
	validates :name_visit, :presence => true
	validates :date_visit, :presence => true
  resourcify
  belongs_to :suspect
end
