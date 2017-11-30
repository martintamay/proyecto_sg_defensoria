class User < ApplicationRecord
  after_initialize :assign_default_role, if: :new_record?
  audited except: [:reset_password_token, :reset_password_sent_at, :last_sign_in_at, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :remember_created_at]
  resourcify
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :registerable,:recoverable,
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  belongs_to :entity
  accepts_nested_attributes_for :entity
  has_many :hearing
  has_many :legal_case
  has_many :equipment_detail
  has_many :shift
  has_many :transfer_case

  def name_with_initial
    "#{entity.full_name}"
  end

  def assign_default_role
    if self.roles.blank?
      self.add_role(:default)
      self.add_role(:assistant)
    end
  end

  def name
    self.entity.full_name
  end

end
