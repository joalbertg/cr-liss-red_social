class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.references :friend, null: false, foreign_key: { to_table: :users }
      t.string :status

      t.timestamps
    end
  end
end
