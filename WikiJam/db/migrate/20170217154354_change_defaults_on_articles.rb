class ChangeDefaultsOnArticles < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:articles, :published, false)
    change_column_default(:articles, :citation_required, false)
  end
end
