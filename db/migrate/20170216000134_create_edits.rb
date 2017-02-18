class CreateEdits < ActiveRecord::Migration[5.0]
  def change
    create_table :edits do |t|
      t.text :edit_body
      t.string :edit_title
      t.references :editor, class_name: "User"
      t.references :article
      t.timestamps
    end
  end
end
