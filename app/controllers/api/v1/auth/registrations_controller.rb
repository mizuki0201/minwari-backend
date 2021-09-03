class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    user = User.new(sign_up_params)
    if user.save
      render_create_success
    else
      render_create_error
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:name, :user_id, :email, :phone, :password)
  end
end
