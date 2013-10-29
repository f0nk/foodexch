class ListingsController < ApplicationController
  #before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy


  def index
  @listings = Listing.paginate(page: params[:page])
  end

  def create
    @listing = current_user.listings.build(params[:listing])
    if @listing.save
      flash[:success] = "Listing created!"
      redirect_to root_url
    else
      @feed_items = []      
      render 'pages/home'
    end
  end

  def destroy
    @listing.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @listing = current_user.listings.find_by_id(params[:id])
      redirect_to root_url if @listing.nil?
    end
end