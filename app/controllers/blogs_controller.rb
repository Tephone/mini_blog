class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(permitted_parameter)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end
  private
  def permitted_parameter
    params.require(:blog).permit(:content)
  end
end
