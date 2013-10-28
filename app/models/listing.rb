class Listing < ActiveRecord::Base
  attr_accessible :background, :city, :country, :description, :imageurl, :region, :title
  belongs_to :user

  validates :background, :city, :country, :description, :region, :title, presence: true
  
  validates :user_id, presence: true
  default_scope order: 'listings.created_at DESC'
end
