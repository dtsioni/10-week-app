class PagesController < ApplicationController
  

  def home
    @posts_list = Post.all
  end
end
