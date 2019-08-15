class BloggersController < ApplicationController
    before_action :set_blogger, only: [:show]
    def index
        @bloggers = Blogger.all
    end
    
    def show
        @total_likes  = @blogger.posts.map(&:likes).reduce(0, :+)
        @feat_post = @blogger.posts.max_by { |post| post.likes }
    end

    def new
        @blogger = Blogger.new()
    end

    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to @blogger
        else
            flash[:errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end
    
    private

    def set_blogger
        @blogger = Blogger.find(params[:id])
    end
    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end