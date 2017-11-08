class Judge < ApplicationRecord
  resourcify
  belongs_to :court
  belongs_to :entity  
  has_many :legal_case

  accepts_nested_attributes_for :entity

  def name_with_initial 
  	"#{entity.full_name}"
  end
end
