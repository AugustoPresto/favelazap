class CreateFacts < ActiveRecord::Migration[6.1]
  def change
    create_table :facts do |t|
      t.string :title
      t.string :communities, array: true, default: []
      t.string :interests, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
