class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy, :increase]
    def index
    @posts = Post.all
  end  

  def show
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(post_params)
    redirect_to @post
  end

  def edit
  end

  def update
     @post = Post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def increase
    # patch "/students/:id/increase" do
    #   find_student
    #   @student.update(age: @student.age + 1)
    #   redirect "/students/#{@student.id}"
    # end
    @post.update(likes: @post.likes + 1)
    redirect_to @post
  end

  private 

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end