class Assistant < ApplicationRecord
  belongs_to :lawyer
  belongs_to :entity
  belongs_to :user

  accepts_nested_attributes_for :entity
  accepts_nested_attributes_for :user
end
