class Admin::CategoriesController < Admin::ApplicationController

  def index
    @categories = Category.all
  end
  
  def show
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        flash[:success] = "Category Created"
        format.html { redirect_to admin_categories_path }
      else
        flash[:error] = "Error saving category!"
        format.html { render :action => "new"}
      end
    end
  end
end