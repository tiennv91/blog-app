class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.attachment :cover_image
      t.string :slug, :unique => true
      t.text :description
      t.text :content
      t.boolean :draft, default: true

      t.timestamps null: false
    end
  end
end
