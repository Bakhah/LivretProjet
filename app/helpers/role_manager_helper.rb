module RoleManagerHelper
  def update_role(user, role)
    user.roles.count
    if role == "student"
      user.add_role :student
    elsif role == "teacher"
      user.add_role :teacher
    elsif role == "tutor"
      user.add_role :tutor
    end
    return true
  end
end
