class AddUserIdToPostsAttempt2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :users_id
    add_reference :posts, :user, foreign_key: true
  end
end
