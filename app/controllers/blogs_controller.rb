class BlogsController < ApplicationController
  
  def index
  end
  
  def new  	
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
	  @blog = Blog.new(blog_params)
	 
	  @blog.save
	  redirect_to @blog
	end

	private
  
  def blog_params
    params.require(:blogs).permit(:title, :text)
  end

end