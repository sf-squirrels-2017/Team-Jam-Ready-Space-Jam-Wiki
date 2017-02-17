class Article < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User"
  has_many :citations
  has_many :edits
  has_many :editors, through: :edits, source: :editor

  def self.search(search)
    where("article_title LIKE ? OR article_body LIKE ?", "%#{search}%", "%#{search}%")
  end
end
