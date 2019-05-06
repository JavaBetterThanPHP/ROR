class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.date :birthdate
      t.string :description
      t.string :profilePictureUrl
      t.date :inscriptionDate
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
