class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.string :action
      t.string :sender
      t.boolean :unread
      t.integer :post_id

      t.timestamps
    end
  end
end
