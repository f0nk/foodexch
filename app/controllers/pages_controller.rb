
class PagesController < ApplicationController
  def help
  end

  def about
  end

  def home
    @listing = current_user.listings.build if signed_in?
  end

  def contact 	
  end

  def blog	
  end

  def privacy  	
  end

  def terms  	
  end

  def home  	
  end
  
  def signup  	
  end
  
  def news  	
  end
end
