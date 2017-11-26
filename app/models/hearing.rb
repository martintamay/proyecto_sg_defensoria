class Hearing < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :legal_case
  def audiencia
  	"#{hearing_date}"
  end
end
