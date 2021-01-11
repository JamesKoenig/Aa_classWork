# == Schema Information
#
# Table name: moderators
#
#  id           :bigint           not null, primary key
#  moderator_id :integer          not null
#  sub_id       :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Moderator < ApplicationRecord
  belongs_to :user,
    foreign_key: :moderator_id,
    class_name:  :User

  belongs_to :sub,
    foreign_key: :sub_id,
    class_name:  :Sub
end
