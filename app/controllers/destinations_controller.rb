class DestinationsController < ApplicationController
    before_action :set_destination, only: [:show]
    def index
        @destinations = Destination.all
    end
    
    def show
        @posts = @destination.posts
        @bloggers = @destination.bloggers.uniq
        @recentfive = @posts.reverse.first(5)
        @feat_post = @posts.max_by { |post| post.likes }

    end
    
    private

    def set_destination
        @destination = Destination.find(params[:id])
    end
end