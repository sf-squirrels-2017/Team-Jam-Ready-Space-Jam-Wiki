class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.boolean :published
      t.boolean :citation_required
      t.belongs_to :creator, class_name: "User"
      t.belongs_to :category

      t.timestamps
    end
  end
end
