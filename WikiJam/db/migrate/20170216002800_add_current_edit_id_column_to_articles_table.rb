class AddCurrentEditIdColumnToArticlesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :current_edit_id, :integer
    add_foreign_key :articles, :edits, column: :current_edit_id
  end
end
