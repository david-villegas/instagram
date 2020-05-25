class UsersController < ApplicationController
  # before_action :set_user. only: [:edit]


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: '¡ Perfil actualizado correctamente !'
    else
      render :edit, alert: '¡ Error al actualizar, intente nuevamente !'
    end
  end
  private

  def user_params
    params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
