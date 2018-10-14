class WishlistsController < ApplicationController
    before_action :logged_in_user

    def index
        @my_wishlist = current_user.wishlist
        @others_wishlists = Wishlist.where("user_id != #{current_user.id}")
    end

    def new
        @wishlist = Wishlist.new
        @wishlist.user = current_user
    end

   def create
        @wishlist = Wishlist.new(wishlist_params)
        if @wishlist.save
          # If user saves in the db successfully:
          flash[:notice] = "Wishlist created!"
          redirect_to @wishlist.user
        else
          # If wishlist fails model validation: probably name
          flash.now.alert = "Oops, couldn't create wishlist."
          if @wishlist.errors.any?
            for message_error in @wishlist.errors.full_messages
              flash.now.alert = "#{message_error}"
            end
          
          end
          render :new
        end
      end

      def edit
        @wishlist = Wishlist.find_by(params[:id])
      end

      def show
        @wishlist = Wishlist.find(params[:id])
      end

      def update
        @wishlist = Wishlist.find(params[:id])
        if @wishlist.update_attributes(wishlist_params)
          redirect_to @wishlist
        else
          render 'edit'
        end
      end

    private
    
      def wishlist_params
        # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
        # that can be submitted by a form to the user model #=> require(:user)
        params.require(:wishlist).permit(:name, :user_id)
      end
end
