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
require 'test_helper'

class ModeratorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
