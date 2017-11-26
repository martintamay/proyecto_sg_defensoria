class CriminalRecord < ApplicationRecord
  resourcify
  
  def number_with_initial 
	"#{inquire_number}"
  end 
end
