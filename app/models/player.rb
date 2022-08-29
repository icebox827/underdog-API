class Player < ApplicationRecord
  validates :first_name, :last_name, presence: true, length: { in: 2..25 }
  validates :position, :age, presence: true
end
