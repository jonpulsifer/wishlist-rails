class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :show, :update]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        # store all names in lowercase to avoid duplicates and case-sensitive login errors
        @user.name.downcase!

        if @user.save
          # If user saves in the db successfully:
          flash[:notice] = "Account created successfully!"
          log_in(@user)
          redirect_to @user
        else
          # If user fails model validation - probably a bad password or duplicate name
          flash.now.alert = "Oops, couldn't create account."
          if @user.errors.any?
            for message_error in @user.errors.full_messages
              flash.now.alert = "#{message_error}"
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
        params.require(:user).permit(:name, :password, :password_confirmation, :shirt_size, :pant_size, :shoe_size, :fav_color, :plus_one)
      end

end
