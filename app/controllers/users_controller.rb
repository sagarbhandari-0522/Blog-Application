class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: %i[edit update]

  def index
    @users = User.all
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit({ role_ids: [] })
  end

  def find_user
    @user = User.find(params[:id])
  end
end
