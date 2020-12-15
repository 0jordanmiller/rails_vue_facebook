class PostsReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :post
      t.belongs_to :user, foreign_key: true
      t.string :name
    end
  end
end
