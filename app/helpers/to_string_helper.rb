module ToStringHelper
  def get_user_full_name(id)
    user = User.find(id)
    return user.first_name + ' ' + user.last_name
  end

  def get_user_role(id)
    user = User.find(id)

    if user.has_role? :student
      return "Étudiant"
    elsif user.has_role? :teacher
      return "Professeur"
    elsif user.has_role? :tutor
      return "Tuteur"
    end
  end
end
