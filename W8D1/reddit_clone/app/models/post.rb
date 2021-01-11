# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  subject    :string
#  body       :text             not null
#  edited     :boolean          default(FALSE)
#  user_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  validates :edited, inclusion: { in: [true,false] }
  validates :body,   presence: true

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub

end
