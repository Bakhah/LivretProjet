class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:role_at_creation, :first_name, :last_name, :email, :password, :password_confirmation, :address, :phone_number, :enterprise_name, :enterprise_position)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :address, :phone_number, :enterprise_name, :enterprise_position)
  end
end
