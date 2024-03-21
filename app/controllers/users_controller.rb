class UsersController < ApplicationController
  def create
    # user = User.new(user_params)
    # if user.save
    #   render json: user, status: :created
    # else
    #   render json: user.errors, status: :unprocessable_entity
    # end

    # user = UserService::Base.create_user(user_params)
    # if user.valid?
    #   render json: user, status: :created
    # else
    #   render json: user, status: :unprocessable_entity
    # end

    result = UserService::Base.create_user(user_params)
    if result.success?
      render json: result.payload, status: :created
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  def index
    # users = UserService::Base.filter_users(params)
    # render json: users, status: :ok

    result = UserService::Base.filter_users(params)
    render json: result.payload, status: :ok
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
