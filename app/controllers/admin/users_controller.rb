class Admin::UsersController < Admin::ApplicationController
  
  before_filter :user_params_id, :only => [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def show
    @user = @User.posts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        flash[:success] = "user Created!"
        format.html { redirect_to admin_users_path }
      else
        flash[:error] = "Error saving user!"
        format.html { render :action => "new"}
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = "user updated!"
        format.html { redirect_to admin_users_path }
      else
        flash[:error] = "Error updating user"
      end
    end
  end
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path }
    end
  end
  
  def user_params_id
    @user = user.find(params[:id])
  end

end
