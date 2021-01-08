class User < ApplicationRecord
  validates :full_name, presence: true, uniqueness: true
  
  has_many :authored_articles,
    foreign_key: :author_id,
    class_name:  :Article,
    optional: true
end
