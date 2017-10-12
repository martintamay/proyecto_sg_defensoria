
class Court < ApplicationRecord

  def name_with_initial
    "#{name}"
  end
end
