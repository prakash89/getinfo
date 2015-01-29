class GroupsController < ApplicationController

  before_action :authenticate_user!
  
  def index
  	@groups = Group.all
  end

  def new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
  	@group = Group.new(group_params)
	  @group.user_id = current_user.id
	  if @group.save
	   render 'index'
    else
      render 'new'
    end
  end

  private
  
  def group_params
    params.require(:groups).permit(:name)
  end
end
