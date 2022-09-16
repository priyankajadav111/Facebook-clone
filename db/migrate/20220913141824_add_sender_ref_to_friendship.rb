class AddSenderRefToFriendship < ActiveRecord::Migration[5.1]
  def change
    add_reference :friendships, :sender, foreign_key: true
    add_reference :friendships, :receiver, foreign_key: true
  end
end
