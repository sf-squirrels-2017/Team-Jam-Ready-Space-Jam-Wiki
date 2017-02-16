class User < ApplicationRecord
  has_secure_password
  has_many :articles
  has_many :citations
  has_many :edits
end
