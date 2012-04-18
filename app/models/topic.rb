class Topic < ActiveRecord::Base
  attr_accessible :name, :last_poster_id, :last_post_at

  has_many :posts, :dependent => :destroy
  belongs_to :user 
  
end
