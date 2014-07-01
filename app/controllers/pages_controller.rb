class PagesController < ApplicationController
  

  def home
    @posts_list = Post.all.order(:created_at).reverse
    
  end
end
