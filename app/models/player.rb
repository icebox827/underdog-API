class Player < ApplicationRecord
  validates :first_name, :last_name, presence: true, length: { in: 2..25 }
  validates :position, :age, presence: true

  before_create :name_brief, :average_position_age_diff

  def name_brief 
    name_brief = "#{first_name[0]} #{last_name}"
    name_brief
  end

  def average_position_age_diff
    player_age = Player.find(params[:age])
    age_num = player_age.to_i 
    total_age = age_num.count
  end
end
