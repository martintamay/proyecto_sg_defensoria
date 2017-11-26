class LegalCase < ApplicationRecord
  audited
  resourcify
  belongs_to :user
  belongs_to :court
  belongs_to :judge
  belongs_to :suspect
  has_many :hearings  
  has_many :transfer_cases
  belongs_to :criminal_record

 def name_with_initial
    "#{name}"
  end
end