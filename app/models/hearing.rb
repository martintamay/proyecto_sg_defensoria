class Hearing < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :legal_case
end
