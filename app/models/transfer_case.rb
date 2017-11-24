class TransferCase < ApplicationRecord
  audited
  resourcify
  belongs_to :user
  belongs_to :legal_case
end
