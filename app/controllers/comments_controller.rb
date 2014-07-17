class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]

  #load_resource :through => :post
  #authorize_resource :through => :post

  def index
    @comments = Comment.all
    @post = Post.find(params[:post_id])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def edit
    
  end

  def create
    
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html {redirect_to post_comment_path(@post, @comment), notice: "Comment was
           successfully created."}
      else
        format.html {render :new}
      end
    end
  end

  def update
    
    respond_to do |format|
      if @comment.update(comment_params)
        format.html {redirect_to post_comment_path(@post, @comment), notice: "Comment
           was successfully updated."}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to home_path, notice: "Comment was 
        successfully destroyed."}
    end
  end

  private
    def set_comment
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    
    

    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end

end