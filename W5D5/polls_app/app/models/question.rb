class Question < ApplicationRecord
  validates :poll_id, presence: true
  validates :text, presence: true
end
