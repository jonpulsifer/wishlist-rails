# typed: false
# frozen_string_literal: true

class GiftsController < ApplicationController
  before_action :logged_in_user

  def new
    @gift = Gift.new
    @gifts = current_user.gifts
  end

  def create
    @user = User.find(gift_params[:user_id])
    @gift = Gift.new(gift_params.except(:user_id))

    if @gift.save
      @user.gifts << @gift
      # If user saves in the db successfully:
      flash[:notice] = 'Gift created!'
      redirect_to(:new_gift)
    else
      # If gift fails model validation: probably amazon.com links lol
      flash.now[:notice] = "Oops, couldn't create gift."
      if @gift.errors.any?
        @gift.errors.full_messages.each do |message_error|
          flash.now[:error] = message_error.to_s
        end

      end
      render(:new)
    end
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def index
    @claimed_gifts = []
    @unclaimed_gifts = []
    FamilyUser
      .where(family_id: current_user.family_ids)
      .where.not(user_id: current_user.id)
      .each do |family_user|
        family_user.user.claimed_gifts.each do |gift|
          @claimed_gifts << gift
        end
        family_user.user.unclaimed_gifts.each do |gift|
          @unclaimed_gifts << gift
        end
      end
  end

  def update
    @gift = Gift.find(params[:id])
    if @gift.update_attributes(gift_params)
      redirect_back(fallback_location: root_path)
    else
      render(:edit)
    end
  end

  def destroy
    @gift = Gift.find(params[:id])

    if @gift.delete
      redirect_to(:new_gift)
    else
      render(:edit)
    end
  end

  private

  def gift_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:gift).permit(:name, :url, :notes, :claimed_by, :id, :gift, :user_id)
  end
end
