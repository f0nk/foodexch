class Listing < ActiveRecord::Base
  attr_accessible :background, :city, :country, :description, :imageurl, :region, :title
  belongs_to :user

  validates :background, :city, :country, :description, :region, :title, presence: true
  
  validates :user_id, presence: true
  default_scope order: 'listings.created_at DESC'

  # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
    
end
