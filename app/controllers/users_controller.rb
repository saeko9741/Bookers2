class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:show, :index, :edit, :update]
	def show
		@user = User.find(params[:id])
		@books = @user.books
		# @books = Book.all
		@book = Book.new
	end

	def index
		@users = User.all
		@user = current_user

		@book = Book.new

	end

	# def create
	# 	@book = Book.new(book_params)
	# 	@book.user_id = current_user.id
	# 	if @book.save
	# 		redirect_to book_path(@book.id)
	# 	else
	# 		@books = Book.all
	# 		render :index
	# 	end
	# end

	def edit
	    @user = User.find(params[:id])
	    if @user.id == current_user.id
	    else
	    	redirect_to user_path(current_user)
	    end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "User info  was successfully edited!"
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end




	private
	    def user_params
	        params.require(:user).permit(:name, :profile_image, :introduction)
	    end

	    def book_params
	        params.require(:book).permit(:title, :body)
	    end

end
