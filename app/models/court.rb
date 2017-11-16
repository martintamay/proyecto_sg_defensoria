
class Court < ApplicationRecord
	validates :phone, numericality: { only_integer: true, allow_blank: true }
  resourcify
  def name_with_initial
    "#{name}"
  end

  has_many :legal_case
  has_many :judge
end
