class AddInterestsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :interests, :string, array: true, default: []
  end
end
