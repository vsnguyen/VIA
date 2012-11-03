class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, :through => :post_categories, :dependent => :destroy
  belongs_to :user
  
  attr_accessible :body, :title, :user_id, :category_ids
end
