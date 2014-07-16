class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

  attr_accessor :remember_token
  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @posts = Post.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save        
        sign_in @user
        flash[:success] = "Welcome!"              
        format.html {redirect_to @user, notice: 'User was successfully created.'}
        format.json {render :show, status: :created, location: @user}

      else
        format.html {render :new}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to @user, notice: 'User was successfully updated.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html { render :edit }
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @user.destroy
    @user.posts.each do
      |post| post.destroy
    end
    @user.comments.each do
      |comment| comment.destroy
    end
    

    respond_to do |format|
      format.html {redirect_to home_path, notice: "User was successfully destroyed."}
      format.json {head :no_content}
    end
  end
  #remember token handling

  

  private
    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(:id, :created_at, :updated_at, :username, :email,
        :password_digest, :password, :password_confirmation,\
        :remember_token)
    end 
end


