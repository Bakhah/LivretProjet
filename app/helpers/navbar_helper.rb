module NavbarHelper
  def get_role_string
    if current_user.has_role? :admin
      return "Administrateur"
    elsif current_user.has_role? :teacher
      return "Professeur"
    elsif current_user.has_role? :tutor
      return "Tuteur"
    else
      return "Étudiant"
    end
  end


  def get_student_list
    if current_user.has_role? :teacher
      return User.where(teacher_id: current_user.id)
    end
    if current_user.has_role? :tutor
      return User.where(tutor_id: current_user.id)
    end
  end
end
