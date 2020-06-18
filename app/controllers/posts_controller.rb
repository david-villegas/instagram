class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:destroy]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = @user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html {redirect_to root_path, notice: "Se ha creado el post"}
      else
        format.html {render :new, alert: "Error inesperado, intente nuevamente"}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @post.destroy
        format.html {redirect_to user_path(@user), notice: 'Post Eliminado'}
      else
        format.html {redirect_to user_path(@user), alert: 'No se pudo eliminar el post, intente nuevamente'}
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
