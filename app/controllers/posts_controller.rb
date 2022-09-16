class PostsController < ApplicationController
  before_action :get_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = @user.posts
  end

  

  def new
    @post = @user.posts.build
  end 

  def edit
    @post = Post.find(params[:id])
   end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end
  def edit
    @post = Post.find(params[:id])
  end


  def create
    @post = @user.posts.build(post_params)

    if @post.save
    redirect_to user_posts_path(@user)
    else
       render 'new'
    end
  end


  def update
    @post = Post.find(params[:id])
   
    if @post.update(post_params)
      redirect_to user_post_path(@user)
    else
      render 'edit'
    end
  end


    def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to user_posts_path(@user), notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
   
  private
  
  def get_user
    
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

    def post_params
      params.require(:post).permit(:post_content, :user_id)
    end
end