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
    class_name:  :Post

  has_many :moderator_joins,
    foreign_key: :sub_id,
    dependent:   :destroy,
    class_name:  :Moderator

  has_many :moderators,
    through: :moderator_joins,
    source:  :user
    
  def add_moderator(user)
    mod = Moderator.new(sub_id: self.id, moderator_id: user.id)
    mod.save
  end
end
