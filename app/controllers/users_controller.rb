class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :check_current_user, only:[:edit]


  def show
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit

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
    params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_current_user
    if user_signed_in?
      if current_user.id != @user.id
        redirect_back fallback_location: edit_user_path(current_user), alert: 'No puedes acceder a otro perfil para editarlo'
      end
    else
      redirect_back fallback_location: root_path, alert: 'Se ha presentado un error, intente nuevamente'
    end
  end

end
