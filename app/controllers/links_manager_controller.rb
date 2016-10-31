class LinksManagerController < ApplicationController
  def index
    @students = User.with_role :student
  end

  def edit_tutor
    @tutors = User.with_role :tutor
    @student_focused = User.find(params[:id])
  end

  def edit_teacher
    @teachers = User.with_role :teacher
    @student_focused = User.find(params[:id])
  end
end
