class AddUserRefToMonthlySelfExamination < ActiveRecord::Migration
  def change
    add_reference :monthly_self_examinations, :user, index: true, foreign_key: true
  end
end
