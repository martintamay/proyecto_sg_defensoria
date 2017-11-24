class Suspect < ApplicationRecord
  audited
  validates :ci, numericality: { only_integer: true}
  validates :reason, :presence => true
  validates :criminal_record, :presence => true
  validates :present_status, :presence => true
  validates :nationality, :presence => true
  validates :home_adress, :presence => true
  resourcify
  belongs_to :entity
  accepts_nested_attributes_for :entity
  has_many :visit
  has_many :legal_case
  has_many :reclusion

  def name_with_initial
  	"#{entity.full_name}"
  end

end
