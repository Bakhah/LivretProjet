class AddFieldsToMonthlySelfExamination < ActiveRecord::Migration
  def change
    add_column :monthly_self_examinations, :teacher_id, :int
    add_column :monthly_self_examinations, :tutor_id, :int
  end
end
