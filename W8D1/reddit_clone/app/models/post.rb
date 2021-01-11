# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  subject    :string
#  body       :text
#  edited     :boolean          default(FALSE)
#  user_id    :integer
#  sub_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  
  


  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub

end
