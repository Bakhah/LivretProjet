class AddFieldsToMonthlySelfEvaluation < ActiveRecord::Migration
  def change
    add_column :monthly_self_evaluations, :teacher_id, :int
    add_column :monthly_self_evaluations, :tutor_id, :int
  end
end
