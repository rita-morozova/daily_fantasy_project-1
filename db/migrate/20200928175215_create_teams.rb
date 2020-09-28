class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.integer :qb
      t.integer :rb1
      t.integer :rb2
      t.integer :wr1
      t.integer :wr2
      t.integer :te
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :contest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
