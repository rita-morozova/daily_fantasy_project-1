class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :nfl_team
      # t.integer :salary

      t.timestamps
    end
  end
end
