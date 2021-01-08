class Section < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :articles,
    foreign_key: :section_id,
    class_name:  :Article
end
