class Post < ActiveRecord::Base
  include Workflow
  has_many :post_categories
  has_many :categories, :through => :post_categories, :dependent => :destroy
  belongs_to :user
  
  attr_accessible :body, :title, :user_id, :category_ids
  
  Workflow do
    state :save_draft do
      
    end
    
    state :save_publish do
    
    end
  end
end
