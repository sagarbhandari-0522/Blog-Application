# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: %i[edit update destroy]

  def index
    @users = User.all
    authorize @users
  end

  def edit
    authorize @user
  end

  def update
    if @user.update(user_params)
      authorize @user
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    authorize @user

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit({ role_ids: [] })
  end

  def find_user
    @user = User.find(params[:id])
  end
end
