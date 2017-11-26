class TransferCase < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :legal_case
end
