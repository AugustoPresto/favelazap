class UpdateColumnsOnUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :communities, :string
    remove_column :users, :interests, :string
    add_column :users, :communities, :string, default: [], array: true
    add_column :users, :interests, :string, default: [], array: true
  end
end
