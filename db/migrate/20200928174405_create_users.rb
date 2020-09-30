class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :balance, default: 0
      t.string :email
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
