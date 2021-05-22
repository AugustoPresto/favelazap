class AddInterestsToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :interests, :string, array: true, default: []
  end
end
