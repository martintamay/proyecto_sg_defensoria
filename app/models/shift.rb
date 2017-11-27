class Shift < ApplicationRecord
  audited
  resourcify
  belongs_to :user
end
