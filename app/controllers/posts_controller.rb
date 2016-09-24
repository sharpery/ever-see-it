class PostsController < ApplicationController

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)

    if @post.save
      flash[:notice] ="Post was saved successfully."
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "There was an error saving this post. Please try again."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.save
      flash[:notice] = "Post was updated successfully."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving this post. Please try again."
      render :edit
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting this post."
      render :show
    end
  end


  private
  def post_params
      params.require(:post).permit(:title, :body)
  end



end
