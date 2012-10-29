class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update, :destoy]
  before_filter :get_cat_id, :only => [:update, :desroy, :edit]
  
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(:all, :include => :posts)
  end
  
  def create
    @category = Category.new(params[:category])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy 
    @category.destroy
    redirect_to root_path, :notice => 'Successfully removed post!'
  end
  
  def get_cat_id
    @category = Category.find(params[:id])
  end
end
