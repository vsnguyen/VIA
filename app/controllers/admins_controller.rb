class AdminsController < ApplicationController
  before_filter :authenticate_user!
end
