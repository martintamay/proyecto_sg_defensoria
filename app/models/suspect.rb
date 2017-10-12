class Suspect < ApplicationRecord
  belongs_to :entity
  accepts_nested_attributes_for :entity
end
 