class Article < ApplicationRecord
  validates :title, :body, :author_id, :section_id, presence: true
  validates :title, uniqueness: { 
                                  scope:
                                    :author_id, 
                                  message:
                                    "should only write that article once!"
                                }

  belongs_to :section,
    foreign_key: :section_id,
    class_name:  :Section

  belongs_to :author,
    foreign_key: :author_id,
    class_name:  :User
end
