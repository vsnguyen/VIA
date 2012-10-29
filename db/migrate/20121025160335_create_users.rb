class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :description
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :password_confirm
      t.string :username

      t.timestamps
    end
  end
end
