class Admin::CategoriesController < Admin::ApplicationController
  before_filter :cat_id, :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end
  
  def show
    @post = @category.posts
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        flash[:success] = "Category Created!"
        format.html { redirect_to admin_categories_path }
      else
        flash[:error] = "Error saving category!"
        format.html { render :action => "new"}
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:success] = "Category updated!"
        format.html { redirect_to admin_categories_path }
      else
        flash[:error] = "Error updating category"
      end
    end
  end
  
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path }
    end
  end
  
  def cat_id 
    @category = Category.find(params[:id])
  end
  
end