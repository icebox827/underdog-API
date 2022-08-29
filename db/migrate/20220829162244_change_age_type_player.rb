class ChangeAgeTypePlayer < ActiveRecord::Migration[7.0]
  def change
    change_column :players, :age, :string
  end
end
