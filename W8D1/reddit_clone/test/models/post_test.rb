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
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
