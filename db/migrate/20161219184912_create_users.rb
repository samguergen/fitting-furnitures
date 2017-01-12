class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :location, null: false
      t.string :email, null: false
      t.string :password_digest
      t.string :gender, null: false
      t.string :description
      t.string :image
      t.integer :furnipoints, :default => 500, null: false
      # t.references :furnitures
      # t.references :favorites, references: :furnitures

      t.timestamps null: false
    end
  end
end
