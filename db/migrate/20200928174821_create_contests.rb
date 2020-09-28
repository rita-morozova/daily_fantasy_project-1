class CreateContests < ActiveRecord::Migration[6.0]
  def change
    create_table :contests do |t|
      t.string :name
      t.integer :prize
      t.integer :budget
      t.integer :game_week

      t.timestamps
    end
  end
end
