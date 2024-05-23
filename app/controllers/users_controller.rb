class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: UserBlueprint.render(users, view: :normal)
  end
  
  def create
    user = User.create(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: UserBlueprint.render(set_user, view: :normal), status: :ok
  end

  def update
    user = set_user
    if set_user.update(user_params)
      render json: UserBlueprint.render(set_user, view: :extended), status: :ok
    else 
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if set_user.destroy
      render json: { message: 'Successfully deleted user.' }
    else
      render json: { error: 'Unable to delete user.' }, status: :unprocessable_entity
    end
  end

  end

  private

  def set_user
    user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type)
  end