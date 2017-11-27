class LawyerAction < ApplicationRecord
  audited
  resourcify
  belongs_to :legal_case
end
