class Player < ApplicationRecord
  validates :first_name, :last_name, presence: true, length: { in: 2..25 }
  validates :position, :age, presence: true

  before_create :add_name_brief

  def add_name_brief
    "#{first_name[0]} #{last_name}"
  end
end
