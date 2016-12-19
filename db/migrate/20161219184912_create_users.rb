class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :location
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :description
      t.string :image
      t.references :furnitures

      t.timestamps null: false
    end
  end
end
