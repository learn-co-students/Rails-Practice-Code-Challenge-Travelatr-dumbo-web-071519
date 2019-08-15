class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :add_like]
    before_action :post_instances, only: [:new, :edit]
    def index
        @posts = Post.all
    end
    
    def show
    end
    
    def new
        @post = Post.new()
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to @post
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
    end

    def update
        @post.update(post_params)
        if @post.valid?
            redirect_to @post
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end
    end

    # def like
    # end
    
    def add_like
        @post.update(likes: @post.likes+=1)
        redirect_to @post
    end
    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end

    def post_instances
        @bloggers = Blogger.all()
        @destinations = Destination.all()
    end
end