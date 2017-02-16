class CreateCitations < ActiveRecord::Migration[5.0]
  def change
    create_table :citations do |t|
      t.string :body
      t.references :user
      t.belongs_to :article

      t.timestamps
    end
  end
end
