class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.date :date
      t.integer :timeToRead
      t.string :mainImage
      t.integer :score
      t.text :content
      t.references :user, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
