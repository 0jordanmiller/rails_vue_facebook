class PostsReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, foreign_key: true
    add_column :posts, :name, :string
  end
end
