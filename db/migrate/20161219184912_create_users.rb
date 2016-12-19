class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :location
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :description
      t.string :image
      t.integer :furnipoints
      t.references :furnitures

      t.timestamps null: false
    end
  end
end
