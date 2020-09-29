class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :nfl_team_code
      t.string :nfl_team_name
      t.float :salary_modifier, default: 1.0

      t.timestamps
    end
  end
end
