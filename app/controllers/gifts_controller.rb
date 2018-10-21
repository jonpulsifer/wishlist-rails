class GiftsController < ApplicationController
  before_action :logged_in_user

  def new
      @gift = Gift.new
      @gifts = current_user.gifts
  end

   def create
        @gift = Gift.new(gift_params)
        @gifts = current_user.gifts

        if @gift.save
          # If user saves in the db successfully:
          flash[:notice] = "Gift created!"
          redirect_to :new_gift
        else
          # If gift fails model validation: probably amazon.com links lol
          flash.now.alert = "Oops, couldn't create gift."
          if @gift.errors.any?
            for message_error in @gift.errors.full_messages
              flash.now.alert = "#{message_error}"
            end

          end
          render :new
        end
      end

      def edit
        @gift = Gift.find_by(params[:id])
      end

      def show
        @gift = Gift.find(params[:id])
      end

      def update
        @gift = Gift.find(params[:id])
        if @gift.update_attributes(gift_params)
          redirect_to user_path
        else
          render :edit
        end
      end

      def destroy
        @gift = Gift.find(params[:id])

        if @gift.delete
          redirect_to :new_gift
        else
          render :edit
        end
      end

    private

      def gift_params
        # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
        # that can be submitted by a form to the user model #=> require(:user)
      params.require(:gift).permit(:name, :url, :purchased_by, :spoken_for_by, :wishlist_id, :id, :gift)
      end
end
