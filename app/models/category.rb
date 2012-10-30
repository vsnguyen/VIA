class Category < ActiveRecord::Base
  # relation
  has_many :posts
  
  #access attr
  attr_accessible :description, :title
end
