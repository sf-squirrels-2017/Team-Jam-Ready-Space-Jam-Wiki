class Article < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User"
  has_many :citations
  has_many :edits
  has_many :editors, through: :edits, source: :editor

end
