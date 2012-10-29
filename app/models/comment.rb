class Comment < ActiveRecord::Base
  # belongs 
  belongs_to :post
  belongs_to :user
  
  # access attr
  attr_accessible :body, :user_id
  
  # methods
  def author
  end
end
