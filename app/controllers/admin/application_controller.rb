class Admin::ApplicationController < ApplicationController
  layout 'layouts/application'    
  before_filter :authenticate_user!  
end
