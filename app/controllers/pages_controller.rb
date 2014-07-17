class PagesController < ApplicationController
  
  before_action :set_users, only: [:control] 

  skip_authorize_resource :only => [:home]

  def home
    @posts_list = Post.all.order(:created_at).reverse    
  end

  def control
    authorize! :update, User
  end

  private
    def set_users
      @users = User.all
    end
end
