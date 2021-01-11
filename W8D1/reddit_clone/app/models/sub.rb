# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord

  has_many :posts,
    foreign_key: :sub_id,
    class_name: :Post
end
