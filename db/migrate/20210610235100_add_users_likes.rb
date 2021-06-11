class AddUsersLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :users_likes, :integer, default: [], array: true
  end
end
