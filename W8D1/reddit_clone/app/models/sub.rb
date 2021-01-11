# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :posts,
    foreign_key: :sub_id,
    class_name: :Post
end
