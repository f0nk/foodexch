class UsersController < ApplicationController
   before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
   before_filter :correct_user,   only: [:edit, :update]
   before_filter :admin_user,     only: :destroy

#//= require bootstrap
 
  def new
  	@user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @listings = @user.listings.paginate(page: params[:page])

  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the The Food Exchange Marketplace!"    	
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end
 
      def admin_user
        redirect_to(root_url) unless current_user.admin?
      end

end
