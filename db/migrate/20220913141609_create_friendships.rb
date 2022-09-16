class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer:status

      t.timestamps
    end
  end
end
