class CreateWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :weeks do |t|
      t.integer :player_id
      t.integer :game_week
      t.integer :score

      t.timestamps
    end
  end
end
