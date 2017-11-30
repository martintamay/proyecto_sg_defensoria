class Shift < ApplicationRecord
  resourcify
  belongs_to :user

  def user_name
    self.user.entity.full_name
  end
end
