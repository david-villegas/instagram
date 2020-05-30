class UsersController < ApplicationController
  before_action :set_user


  def show
    @posts = @user.posts.order(created_at: :desc)
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
    @user = current_user
  end


end
