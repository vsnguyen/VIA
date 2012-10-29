class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  
  has_many :comments, :through => :user
  
  attr_accessible :body, :title, :user_id
  
  def author
  end
end
