class CreateEdits < ActiveRecord::Migration[5.0]
  def change
    create_table :edits do |t|
      t.string :article_body
      t.string :article_title
      t.belongs_to :editor, class_name: "User"
      t.belongs_to :article
      t.timestamps
    end
  end
end
