module ToStringHelper
  def get_student_name(id)
    student = User.find(id)
    return student.first_name + ' ' + student.last_name
  end
end
