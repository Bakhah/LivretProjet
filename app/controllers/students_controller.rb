class StudentsController < ApplicationController
  def menu
    @student_focused = User.find(params[:id])
    @student_focused_name = get_user_full_name(@student_focused.id)
  end
end
