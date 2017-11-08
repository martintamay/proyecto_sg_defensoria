class LawyerAction < ApplicationRecord
  resourcify
  belongs_to :legal_case
end
