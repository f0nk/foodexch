class ListingsController < ApplicationController
  #before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :signed_in_user

  def index
  	#@listings = Listing.paginate(page: params[:page])
  end

  def create
    @listing = current_user.listings.build(params[:listing])
    if @listing.save
      flash[:success] = "Listing created!"
      redirect_to root_url
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end