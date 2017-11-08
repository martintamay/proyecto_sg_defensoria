
class Court < ApplicationRecord
  resourcify
  def name_with_initial
    "#{name}"
  end

  has_many :legal_case
  has_many :judge
end
