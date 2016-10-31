class LinksManagerController < ApplicationController
  before_action :authenticate_user!
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

  def update_teacher
    user_focused = User.find(params[:id])
    user_focused.teacher_id = params[:teacher_id]
    respond_to do |format|
        if user_focused.save
            format.html { redirect_to links_manager_path, notice: 'Le professeur de ' + get_user_full_name(user_focused) + ' a bien été modifié.' }
            format.json { render :show, status: :created, location: links_manager_path }
        else
            format.html { redirect_to links_manager_path, notice: 'Erreur'}
            format.json { render json: user_focused.errors, status: :unprocessable_entity }
        end
    end
  end

  def update_tutor
    user_focused = User.find(params[:id])
    user_focused.tutor_id = params[:tutor_id]
    respond_to do |format|
        if user_focused.save
            format.html { redirect_to links_manager_path, notice: 'Le tuteur de ' + get_user_full_name(user_focused) + ' a bien été modifié.' }
            format.json { render :show, status: :created, location: links_manager_path }
        else
            format.html { render :new }
            format.json { render json: user_focused.errors, status: :unprocessable_entity }
        end
    end
  end
end
