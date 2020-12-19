class Poll < ApplicationRecord
  validates :author_id, presence: true
  validates :title, presence: true
end
