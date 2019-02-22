class CreateCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :create_users do |t|
      t.string :username
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :zip
      t.string :password_digest

      t.timestamps
    end
  end
end
