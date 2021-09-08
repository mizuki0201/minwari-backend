class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    user = User.new(sign_up_params)
    if user.save
      render json: {status: 200, user: user}
    else
      render json: {status: 301}
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:name, :user_id, :email, :phone, :password)
  end
end
