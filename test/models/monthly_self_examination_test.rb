# == Schema Information
#
# Table name: monthly_self_examinations
#
#  id              :integer          not null, primary key
#  periode         :string
#  what_ive_done   :string
#  what_ive_learnt :string
#  what_ive_felt   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

require 'test_helper'

class MonthlySelfExaminationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
