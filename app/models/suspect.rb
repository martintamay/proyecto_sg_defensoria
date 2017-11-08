class Suspect < ApplicationRecord
  resourcify
  belongs_to :entity
  accepts_nested_attributes_for :entity
  has_many :visit
  has_many :legal_case
  has_many :reclusion

  def name_with_initial 
  	"#{entity.full_name}"
  end
  	
end
 