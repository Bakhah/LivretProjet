class RoleManagerController < ApplicationController
    before_action :authenticate_user!

    def index
        @students = User.with_role(:student)
        @teachers = User.with_role(:teacher)
        @tutors = User.with_role(:tutor)
    end

    def edit
        @user_focused = User.find(params[:id])
    end

    def update_role
      user_focused = User.find(params[:id])
      user_focused.roles = []
      if params[:role] == 'teacher'
          user_focused.add_role :teacher
      elsif params[:role] == 'tutor'
          user_focused.add_role :tutor
      else
          user_focused.add_role :student
      end
      respond_to do |format|
          if user_focused.save
              format.html { redirect_to role_manager_path, notice: 'Le rôle de ' + get_user_full_name(user_focused) + ' a bien été modifié.' }
              format.json { render :show, status: :created, location: role_manager_path }
          else
              format.html { render :new }
              format.json { render json: user_focused.errors, status: :unprocessable_entity }
          end
      end
    end
end
