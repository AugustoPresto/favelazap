class AddCommunitiesToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :communities, :string, array: true, default: []
  end
end
