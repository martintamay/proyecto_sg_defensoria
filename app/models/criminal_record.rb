class CriminalRecord < ApplicationRecord
  audited
  resourcify

  def number_with_initial
	"#{inquire_number}"
  end
end
