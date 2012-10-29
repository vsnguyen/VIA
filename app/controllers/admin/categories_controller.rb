class Admin::CategoriesController < Admin::ApplicationController

  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
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
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
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
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path }
    end
  end
  
end