class RolesController < ApplicationController
  def index
    @role = Roll.all
  end
end
