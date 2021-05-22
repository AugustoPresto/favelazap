class AddReporterToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reporter, :boolean, default: false
  end
end
