class EquipmentDetail < ApplicationRecord
  audited
  resourcify
  belongs_to :legal_case
  belongs_to :user
end
