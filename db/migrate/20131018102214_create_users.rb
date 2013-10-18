class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.date :birthdate
      t.string :home_city
      t.integer :zipcode
      t.string :gravatar
      t.timestamps
    end
  end
end
