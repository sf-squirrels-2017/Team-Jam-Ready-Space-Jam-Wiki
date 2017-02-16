class User < ApplicationRecord
  has_secure_password
  has_many :articles
  has_many :citations
  has_many :edits
  has_many :edited_articles, through: :edits, source: :articles
end
