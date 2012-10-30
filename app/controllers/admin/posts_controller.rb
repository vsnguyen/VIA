class Admin::PostsController < Admin::ApplicationController
  before_filter :post_id, :only => [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end
  
  def show
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        flash[:success] = "Category Created!"
        format.html { redirect_to admin_posts_path }
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
      if @post.update_attributes(params[:post])
        flash[:success] = "Category updated!"
        format.html { redirect_to admin_posts_path }
      else
        flash[:error] = "Error updating category"
      end
    end
  end
  
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_path }
    end
  end
  
  def post_id 
    @post = Post.find(params[:id])
  end
  
end