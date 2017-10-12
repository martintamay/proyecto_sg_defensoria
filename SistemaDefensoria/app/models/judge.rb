class Judge < ApplicationRecord
  belongs_to :court
  belongs_to :entity  

  accepts_nested_attributes_for :entity
end
