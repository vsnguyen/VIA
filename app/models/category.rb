class Category < ActiveRecord::Base
  # belongs

  # relation
  has_many :posts
  
  #access attr
  attr_accessible :description, :title
  
  # methods
end
