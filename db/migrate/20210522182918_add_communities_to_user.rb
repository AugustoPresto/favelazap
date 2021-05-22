class AddCommunitiesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :communities, :string, array: true, default: []
  end
end
