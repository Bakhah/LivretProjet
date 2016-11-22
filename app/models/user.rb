# == Schema Information
# Table name: users
#
#  id                     :integer          not null, primary key
#
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  role                   :string           default("student")
#

class User < ActiveRecord::Base
    rolify before_add: :before_add_method
    rolify after_create: :assign_role

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    def before_add_method(role)
        # do something before it gets added
    end

    after_create :assign_role

    def get_complete_name
      return self.first_name + " " + self.last_name
    end

    def assign_role
        case role_at_creation
        when 'teacher'
            add_role(:teacher)
        when 'tutor'
            add_role(:tutor)
        else
            add_role(:student)
        end
    end
end
