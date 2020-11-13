# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit show update]
  layout "login", only: [:new, :create]

  def new
    @user = User.new
  end

  def index
    @user = current_user
    @users = User.where.not(id: current_user)
  end

  def create
    @user = User.new(
      name: user_params[:name],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation],
      family: Family.find_by(pin: user_params[:family_id])
    )
    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = 'Account created successfully!'
      log_in(@user)
      redirect_to @user
    else
      # If user fails model validation - probably a bad password or duplicate name
      flash.now[:notice] = "Oops, couldn't create account."
      if @user.errors.any?
        @user.errors.full_messages.each do |message_error|
          flash.now[:error] = message_error.to_s
        end
      end
      render :new
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @users = User.where.not(id: current_user)
    @gifts = Gift.claimed_by_user(@user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(
      :name, :password, :password_confirmation, :family_id,
      :address, :shirt_size, :pant_size, :shoe_size, :dress_size
    )
  end
end
