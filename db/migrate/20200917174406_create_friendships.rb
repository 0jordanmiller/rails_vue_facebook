class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.boolean :accepted
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :friend, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
    # add_foreign_key :friendships, :users, column: :friend_id
  end
end
