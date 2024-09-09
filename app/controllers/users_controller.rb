class UsersController < ApplicationController
  before_action :is_matching_login_user,only: [:edit,:update]

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
     flash[:notice]="You have created book successfully."
     redirect_to book_path(@book.id)
    else
      render:index
    end
  end

  def index
    @users=User.all
    @user=current_user
    @book=Book.new
  end

  def show
    @user=User.find(params[:id])
    @user_books=@user.books
    @book=Book.new
  end

  def edit
    is_matching_login_user
  end

  def update
    is_matching_login_user
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render:edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end

    def is_matching_login_user
      @user=User.find(params[:id])
      unless @user.id==current_user.id
        redirect_to user_path(current_user.id)
      end
    end
end
