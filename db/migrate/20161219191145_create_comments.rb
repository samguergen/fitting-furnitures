class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.references :post
      t.references :user
      # t.references :post, index: true, foreign_key: true
      # t.references :commentable, polymorphic: true

      t.timestamps null: false
    end
  end
end
