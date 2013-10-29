
class PagesController < ApplicationController
  def help
  end

  def about
  end

  def home
    if signed_in?
      @listing  = current_user.listings.build
     # @feed_items = current_user.feed.paginate(page: params[:page])
      @feed_items = Listing.paginate(page: params[:page])   
    end
  end

  def contact 	
  end

  def blog	
  end

  def privacy  	
  end

  def terms  	
  end
  
  def signup  	
  end
  
  def news  	
  end
end
