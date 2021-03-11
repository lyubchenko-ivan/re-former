class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    #create new user
    @user = User.new(user_params)

    # user saved in DB?
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end


  def update
    # @user = User.find(params[:id])




    if User.update(params[:id], user_params)
      redirect_to edit_user_path(params[:id])
    else
      render edit_user_path


    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def index
    @users = User.limit(10)
  end

  private
  def user_params
    params.require("user").permit(:username, :password, :email)
  end
end
