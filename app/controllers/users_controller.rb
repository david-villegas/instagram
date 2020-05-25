class UsersController < ApplicationController
  # before_action :set_user. only: [:edit]


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


end
