class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t| 
      t.boolean :accepted
      t.belongs_to :user

      t.timestamps
    end
  end
end
