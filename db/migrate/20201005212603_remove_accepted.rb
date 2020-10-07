class RemoveAccepted < ActiveRecord::Migration[6.0]
  def change
    remove_column :friendships, :accepted
  end
end
