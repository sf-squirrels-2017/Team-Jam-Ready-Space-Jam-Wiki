class Article < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User"
  has_many :citations
  has_many :edits
  has_many :editors, through: :edits, source: :editor

  def self.search(search)
    where("article_title ILIKE ? OR article_body ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
