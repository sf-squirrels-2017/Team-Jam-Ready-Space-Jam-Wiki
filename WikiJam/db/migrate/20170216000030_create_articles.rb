class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.boolean :published
      t.boolean :citation_required
      t.text :article_body
      t.string :article_title
      t.references :creator, class_name: "User"
      t.references :category
      t.timestamps
    end
  end
end
