# typed: false
# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  layout "login", only: [:new, :create]

  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @user = current_user
    @families = @user.families
  end

  def create
    @user = User.new(user_params.except(:pin))
    family = Family.find_by(pin: user_params[:pin])
    @user.families << family unless family.nil?
    if @user.save
      log_in(@user)
      redirect_to(edit_user_path(@user))
    else
      flash.now[:notice] = "Oops, couldn't create account."
      if @user.errors.any?
        @user.errors.full_messages.each do |message_error|
          flash.now[:error] = message_error.to_s
        end
      end
      render(:new)
    end
  end

  def edit
    if current_user != @user
      redirect_to(root_path)
    end
  end

  def show
    @is_current_user = @user == current_user
    @claimed_gifts = Gift.claimed_by_user(@user)
  end

  def update
    family = Family.find_by(pin: user_params[:pin])
    @user.families << family unless family.nil?
    if @user.update(user_params.except(:pin))
      redirect_to(@user)
    else
      render('edit')
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(
      :name, :password, :password_confirmation,
      :address, :shirt_size, :pant_size, :shoe_size, :dress_size, :pin
    )
  end
end
