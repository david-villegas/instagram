class PostsController < ApplicationController
  before_action :set_user


  def new
    @post = Post.new
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

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end

  def set_user
    @user = current_user
  end
end
