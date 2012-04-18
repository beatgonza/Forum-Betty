class Post < ActiveRecord::Base
  attr_accessible :content

  belongs_to :topic
  belongs_to :user 
  
end
